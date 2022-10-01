import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularyInput extends StatelessWidget {
  late String label;
  late String hintText;
  final double sizeOfLabel = 24.00;

  late TextEditingController Controller;
  FormularyInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.Controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: Controller,
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
