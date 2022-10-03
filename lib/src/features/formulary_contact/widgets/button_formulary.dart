import 'package:flutter/material.dart';

class ButtonFormulary extends StatelessWidget {
  void Function() action;

  ButtonFormulary({required void Function() this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: const Text("Confirm"),
    );
  }
}
