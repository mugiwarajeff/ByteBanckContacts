import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/app_dependencies.dart';
import 'package:my_app/http/http_client.dart';
import 'package:my_app/http/http_exception.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';
import 'package:my_app/src/features/transferencies/models/transferency_model.dart';
import 'package:my_app/src/shared/waiting.dart';
import 'package:uuid/uuid.dart';

import '../../shared/response_dialog.dart';
import 'widgets/confirm_dialog.dart';

class TransferencyForm extends StatefulWidget {
  final String nameOfTransferency;
  final int? accountNumber;
  final String transactionUUID;

  TransferencyForm(
      {super.key,
      required this.nameOfTransferency,
      required this.accountNumber,
      required this.transactionUUID});

  @override
  State<TransferencyForm> createState() => _TransferencyFormState();
}

class _TransferencyFormState extends State<TransferencyForm> {
  final String appBarTitle = "Transferency Form";

  final String buttonText = "Confirm";

  final TextEditingController valueController = TextEditingController();

  bool _progressVisible = false;

  void _showFailureMessage(BuildContext context, String message) {
    showDialog(
        context: context, builder: ((contextDialog) => FailureDialog(message)));
  }

  void _showSuccesMessage(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return SuccessDialog("Successful Transaction");
        });
    Navigator.of(context).pop();
  }

  void _confirmTransferency(BuildContext context,
      Transaction transactionCreated, String password) async {
    final AppDependencies dependencies = AppDependencies.of(context);
    try {
      final Transaction? transactionResponse = await dependencies
          .transactionWebClient
          .postTransaction(transactionCreated, password)
          .whenComplete(() => setLoadingState());

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

  void setLoadingState() {
    setState(() {
      _progressVisible = !_progressVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.transactionUUID);
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Visibility(
            visible: _progressVisible,
            child: const Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: WaitingWidget(),
            ),
          ),
          Text(
            widget.nameOfTransferency,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.accountNumber.toString(),
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
                        id: 0,
                        name: widget.nameOfTransferency,
                        number: widget.accountNumber);

                    Transaction transaction = Transaction(
                        id: widget.transactionUUID,
                        value: value,
                        transferency: transferency);

                    showDialog(
                        context: context,
                        builder: (contextDialog) =>
                            ConfirmDialog(confirmFunction: (String password) {
                              _confirmTransferency(
                                  context, transaction, password);
                              Navigator.of(contextDialog).pop();
                              setLoadingState();
                            }));
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
