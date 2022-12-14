import 'package:flutter/material.dart';

import 'widgets/transaction_list.dart';

class TransactionFeed extends StatefulWidget {
  final String appBarTitle = "Transaction Feed";

  const TransactionFeed({super.key});
  @override
  State<TransactionFeed> createState() {
    return TransactionFeedState();
  }
}

class TransactionFeedState extends State<TransactionFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle)),
      body: TransactionList(),
    );
  }
}
