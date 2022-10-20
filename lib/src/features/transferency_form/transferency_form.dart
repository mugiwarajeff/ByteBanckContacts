import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/http/http_client.dart';
import 'package:my_app/http/http_exception.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';
import 'package:my_app/src/features/transferencies/models/transferency_model.dart';

import '../../shared/response_dialog.dart';
import 'widgets/confirm_dialog.dart';

class TransferencyForm extends StatelessWidget {
  final String appBarTitle = "Transferency Form";
  final String buttonText = "Confirm";
  final String nameOfTransferency;
  final int? accountNumber;
  final TextEditingController valueController = TextEditingController();
  final TransactionWebClient webClient = TransactionWebClient();

  TransferencyForm(
      {super.key,
      required this.nameOfTransferency,
      required this.accountNumber});

  void _showFailureMessage(BuildContext context, String message) {
    showDialog(
        context: context, builder: ((contextDialog) => FailureDialog(message)));
  }

  void _showSuccesMessage(BuildContext context) {
    showDialog(
            context: context,
            builder: (contextDialog) {
              return SuccessDialog("Successful Transaction");
            })
        .then((value) => Navigator.pop(context))
        .then((value) => Navigator.pop(context));
  }

  void _confirmTransferency(BuildContext context,
      Transaction transactionCreated, String password) async {
    try {
      final Transaction? transactionResponse =
          await webClient.postTransaction(transactionCreated, password);

      if (transactionResponse != null) {
        _showSuccesMessage(context);
      }
    } on TimeoutException {
      _showFailureMessage(context, "Timeout exception");
    } on HTTPException catch (e) {
      _showFailureMessage(context, e.message);
    } on Exception {
      _showFailureMessage(context, "Unknown error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            nameOfTransferency,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            accountNumber.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          FormularyInput(
              label: "value", hintText: "value", controller: valueController),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (() {
                  final double? value = double.tryParse(valueController.text);
                  if (value != null) {
                    Transferency transferency = Transferency(
                        id: 0, name: nameOfTransferency, number: accountNumber);
                    Transaction transaction = Transaction(
                        id: "0", value: value, transferency: transferency);
                    showDialog(
                        context: context,
                        builder: (context) => ConfirmDialog(
                              confirmFunction: (String password) =>
                                  _confirmTransferency(
                                      context, transaction, password),
                            ));
                  } else {
                    Navigator.of(context).pop();
                  }
                }),
                child: Text(buttonText)),
          )
        ]),
      ),
    );
  }
}
