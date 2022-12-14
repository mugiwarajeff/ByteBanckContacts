import 'package:flutter/material.dart';
import 'package:my_app/database/dao/contacts_dao.dart';
import 'package:my_app/src/features/transferencies/widgets/transferency_list.dart';
import 'package:my_app/src/shared/waiting.dart';
import 'package:my_app/src/features/formulary_contact/formulary_contact.dart';

import '../../../app_dependencies.dart';
import 'models/transferency_model.dart';

class ContactPage extends StatefulWidget {
  final String appBarTitle = "Transferencies";

  ContactPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactPageState();
  }
}

class ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final AppDependencies dependencies = AppDependencies.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle)),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)).then(
          (value) => dependencies.contactDAO.getAll(),
        ),
        builder: ((context, snapshot) {
          List<Transferency> contacts = [];
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const WaitingWidget();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.data != null) {
                contacts = snapshot.data!;
              }
              return TransferencyList(contacts: contacts);
          }
          return const Text("Erro 500");
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => FormularyContact())))
              .then((value) => setState(
                    () {},
                  ));
        },
      ),
    );
  }
}
