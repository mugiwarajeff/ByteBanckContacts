import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import 'contact_item.dart';

// ignore: must_be_immutable
class ContactList extends StatelessWidget {
  late List<Contact> contacts;

  ContactList({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: ((context, index) {
        return ContactItem(
          contact: contacts[index],
        );
      }),
    );
  }
}
