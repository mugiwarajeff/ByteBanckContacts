import 'package:flutter/cupertino.dart';

import 'formulary_input.dart';

// ignore: must_be_immutable
class InputFormularyList extends StatelessWidget {
  final String nameInputHint = "Insira um Nome";
  final String nameInputLabel = "Name";
  final String numberInputHint = "0000";
  final String numberInputLabel = "Number";

  late TextEditingController nameController;
  late TextEditingController numberController;

  InputFormularyList(
      {super.key,
      required this.nameController,
      required this.numberController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormularyInput(
          controller: nameController,
          hintText: nameInputHint,
          label: nameInputLabel,
        ),
        FormularyInput(
          controller: numberController,
          hintText: numberInputHint,
          label: numberInputLabel,
        )
      ],
    );
  }
}
