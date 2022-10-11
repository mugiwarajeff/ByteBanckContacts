import 'package:flutter/material.dart';
import 'package:my_app/http/http_client.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';
import 'package:my_app/src/features/transferencies/models/transferency_model.dart';

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

  void confirmTransferency(
      BuildContext context, Transaction transaction) async {
    Transaction transactionResponse =
        await webClient.postTransaction(transaction);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(transactionResponse);
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
                    confirmTransferency(context, transaction);
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
