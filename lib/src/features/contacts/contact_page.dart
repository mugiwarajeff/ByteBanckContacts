import 'package:flutter/material.dart';
import 'package:my_app/src/features/formulary_contact/formulary_contact.dart';
import 'package:my_app/src/features/Contacts/widgets/Contact_item.dart';
import 'package:my_app/src/features/Contacts/widgets/contact_list.dart';

import '../../shared/models/contact_model.dart';

class ContactPage extends StatefulWidget {
  final String appBarTitle = "Contacts";
  final Contact contact = Contact(name: "jefferson", number: 100);
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

          setState(() {
            widget.contacts.add(contatoRecebido);
          });
        },
      ),
    );
  }
}
