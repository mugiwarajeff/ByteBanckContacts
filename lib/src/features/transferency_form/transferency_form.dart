import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';

class TransferencyForm extends StatelessWidget {
  final String appBarTitle = "Transferency Form";
  final String buttonText = "Confirm";
  final TextEditingController controller = TextEditingController();
  final String nameOfTransferency;
  final int? accountNumber;

  TransferencyForm(
      {super.key,
      required this.nameOfTransferency,
      required this.accountNumber});

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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          FormularyInput(
              label: "value", hintText: "value", controller: controller),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: (() {}), child: Text(buttonText)),
          )
        ]),
      ),
    );
  }
}
