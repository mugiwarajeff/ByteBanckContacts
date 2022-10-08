import 'package:flutter/material.dart';
import '../models/transferency_model.dart';
import 'transferency_item.dart';

// ignore: must_be_immutable
class TransferencyList extends StatelessWidget {
  late List<Transferency> contacts;

  TransferencyList({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: ((context, index) {
        return TrasferencyItem(
          contact: contacts[index],
        );
      }),
    );
  }
}
