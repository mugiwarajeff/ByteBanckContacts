import 'package:flutter/cupertino.dart';

import 'formulary_input.dart';

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
          Controller: nameController,
          hintText: nameInputHint,
          label: nameInputLabel,
        ),
        FormularyInput(
          Controller: numberController,
          hintText: numberInputHint,
          label: numberInputLabel,
        )
      ],
    );
  }
}
