import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonFormulary extends StatelessWidget {
  void Function() action;

  ButtonFormulary({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: const Text("Confirm"),
    );
  }
}
