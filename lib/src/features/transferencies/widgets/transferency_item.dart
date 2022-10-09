import 'package:flutter/material.dart';
import 'package:my_app/src/features/transferency_form/transferency_form.dart';
import '../models/transferency_model.dart';

// ignore: must_be_immutable
class TrasferencyItem extends StatelessWidget {
  late Transferency contact;
  TrasferencyItem({super.key, required this.contact});

  void callTransferencyForm(
      BuildContext context, int? accountNumber, String name) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => TransferencyForm(
              accountNumber: accountNumber,
              nameOfTransferency: name,
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () =>
            callTransferencyForm(context, contact.number, contact.name),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              contact.name.toString(),
              style: const TextStyle(fontSize: 18.00),
            ),
          ),
          subtitle: Text(
            contact.number.toString(),
            style: const TextStyle(fontSize: 16.00),
          ),
        ),
      ),
    );
  }
}
