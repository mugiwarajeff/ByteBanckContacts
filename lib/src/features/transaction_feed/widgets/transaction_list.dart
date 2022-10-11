import 'package:flutter/material.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';
import 'package:my_app/src/features/transaction_feed/widgets/transaction_item.dart';
import 'package:my_app/src/shared/alert_of_error.dart';
import 'package:my_app/src/shared/waiting.dart';

import '../../../../http/http_client.dart';

class TransactionList extends StatefulWidget {
  final TransactionWebClient webClient = TransactionWebClient();

  TransactionList({super.key});

  @override
  State<TransactionList> createState() {
    return TransactionListState();
  }
}

class TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2))
            .then((value) => widget.webClient.getAll()),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const WaitingWidget();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction>? transactions = snapshot.data;
                if (transactions!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: ((context, index) => TransactionItem(
                            subtitle: transactions[index]
                                .transferency
                                .number
                                .toString(), //
                            title: transactions[index].value.toString(),
                          )));
                }
                return const AlertError(
                  message: "The list is Empty!",
                  icon: Icons.hourglass_empty_outlined,
                );
              }
          }
          return const AlertError(
            message: "Unknow Error",
            icon: Icons.warning,
          );
        }));
  }
}
