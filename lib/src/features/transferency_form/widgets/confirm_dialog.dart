import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String titleText = "Authenticate";
  final Function(String password) confirmFunction;
  final TextEditingController passwordController = TextEditingController();

  ConfirmDialog({super.key, required this.confirmFunction});

  void _cancelFunction(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleText),
      content: TextField(
        controller: passwordController,
        textAlign: TextAlign.center,
        maxLength: 4,
        obscureText: true,
        style: const TextStyle(fontSize: 48, letterSpacing: 24),
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => _cancelFunction(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => confirmFunction(passwordController.text),
          child: const Text("Approve"),
        )
      ],
    );
  }
}
