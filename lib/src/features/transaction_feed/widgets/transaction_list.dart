import 'package:flutter/cupertino.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';
import 'package:my_app/src/features/transaction_feed/transaction_feed_page.dart';
import 'package:my_app/src/features/transaction_feed/widgets/transaction_item.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> transactions = [
    Transaction(id: 0, name: "luiz", value: 1000)
  ];
  @override
  State<TransactionList> createState() {
    return TransactionListState();
  }
}

class TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.transactions.length,
        itemBuilder: ((context, index) => TransactionItem(
              subtitle: widget.transactions[index].value.toString(),
              title: widget.transactions[index].name,
            )));
  }
}
