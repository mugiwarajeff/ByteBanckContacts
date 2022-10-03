import 'package:flutter/material.dart';
import 'package:my_app/src/features/formulary_contact/widgets/button_formulary.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input_list.dart';
import 'package:my_app/src/shared/models/contact_model.dart';

class FormularyContact extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  void confirmContact(BuildContext context) {
    String name = nameController.text;
    int? number = int.tryParse(numberController.text);
    Contact? newContact;

    if (name != "" || number != null) {
      Navigator.of(context).pop(Contact(name: name, number: number));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register a Contact")),
      body: Column(children: [
        InputFormularyList(
          nameController: nameController,
          numberController: numberController,
        ),
        ButtonFormulary(action: () => confirmContact(context)),
      ]),
    );
  }
}
