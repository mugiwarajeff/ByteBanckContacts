import 'package:flutter/material.dart';
import 'package:my_app/src/features/formulary_contact/widgets/button_formulary.dart';
import 'package:my_app/database/dao/contacts_dao.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input_list.dart';
import 'package:my_app/src/shared/models/contact_model.dart';

class FormularyContact extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final ContactDAO contactDAO = ContactDAO();

  FormularyContact({super.key});

  void confirmContact(BuildContext context) {
    String name = nameController.text;
    int? number = int.tryParse(numberController.text);

    if (name != "" || number != null) {
      contactDAO.insertDataBase(Contact(id: 0, name: name, number: number));
      Navigator.of(context).pop();
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
