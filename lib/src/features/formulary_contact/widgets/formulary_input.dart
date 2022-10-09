import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormularyInput extends StatelessWidget {
  late String label;
  late String hintText;
  final double sizeOfLabel = 24.00;

  late TextEditingController controller;
  FormularyInput({
    super.key,
    required this.label,
    required this.hintText,
    // ignore: non_constant_identifier_names
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(fontSize: sizeOfLabel),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
