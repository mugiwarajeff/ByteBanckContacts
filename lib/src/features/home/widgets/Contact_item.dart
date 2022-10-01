import 'package:flutter/material.dart';

import '../../../shared/models/contact_model.dart';

class ContactItem extends StatelessWidget {
  late Contact contact;
  ContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.people_outlined),
        title: Text(contact.name.toString()),
        subtitle: Text(contact.number.toString()),
      ),
    );
  }
}
