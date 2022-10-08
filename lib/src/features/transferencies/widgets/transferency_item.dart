import 'package:flutter/material.dart';
import '../models/transferency_model.dart';

// ignore: must_be_immutable
class TrasferencyItem extends StatelessWidget {
  late Transferency contact;
  TrasferencyItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
