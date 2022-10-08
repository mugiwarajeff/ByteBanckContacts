import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const TransactionItem(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
