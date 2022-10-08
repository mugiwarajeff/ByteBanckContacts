import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const TransactionItem(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
