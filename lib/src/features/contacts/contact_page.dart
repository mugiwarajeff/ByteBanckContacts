import 'package:flutter/material.dart';
import 'package:my_app/src/features/contacts/widgets/contact_list.dart';
import 'package:my_app/src/features/formulary_contact/formulary_contact.dart';

import '../../shared/models/contact_model.dart';

class ContactPage extends StatefulWidget {
  final String appBarTitle = "Contacts";
  final List<Contact> contacts = [];

  @override
  State<StatefulWidget> createState() {
    return ContactPageState();
  }
}

class ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle)),
      body: ContactList(
        contacts: widget.contacts,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Contact contatoRecebido = await Navigator.push(context,
              MaterialPageRoute(builder: ((context) => FormularyContact())));

          if (contatoRecebido != null) {
            setState(() {
              print("entrou ");
              widget.contacts.add(contatoRecebido);
            });
          }
        },
      ),
    );
  }
}
