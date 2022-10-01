import 'package:flutter/cupertino.dart';

import '../../../shared/models/contact_model.dart';
import 'Contact_item.dart';

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
