import 'package:flutter/material.dart';
import 'package:my_app/src/features/home/widgets/contact_box.dart';

class HomePage extends StatelessWidget {
  final String appBarTitle = "Dashboard";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/bytebank_logo.png"),
            const ContactBox()
          ],
        ),
      ),
    );
  }
}
