import 'package:flutter/material.dart';
import 'package:my_app/src/features/home/widgets/feature_box.dart';

import '../transferencies/transferency_page.dart';
import '../transaction_feed/transaction_feed_page.dart';

class HomePage extends StatelessWidget {
  final String appBarTitle = "Dashboard";
  final String transferTitle = "Transfer";
  final IconData transferIcon = Icons.monetization_on;
  final String transactionFeedTitle = "Transaction Feed";
  final IconData transactionFeedIcon = Icons.description;

  const HomePage({super.key});

  void _navigateToTransferency(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactPage()));
  }

  void _navigateToTransaction(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => TransactionFeed())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/bytebank_logo.png"),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    FeatureBox(
                      title: transferTitle,
                      icon: transferIcon,
                      callBack: () => _navigateToTransferency(context),
                    ),
                    FeatureBox(
                      title: transactionFeedTitle,
                      icon: transactionFeedIcon,
                      callBack: () => _navigateToTransaction(context),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
