import 'package:flutter/material.dart';

class WaitingWidget extends StatelessWidget {
  final String loadingText = "Loading...";

  const WaitingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(loadingText),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
