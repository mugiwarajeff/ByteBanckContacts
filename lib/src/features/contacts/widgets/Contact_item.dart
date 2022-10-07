import 'package:flutter/material.dart';
import '../../../shared/models/contact_model.dart';

// ignore: must_be_immutable
class ContactItem extends StatelessWidget {
  late Contact contact;
  ContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            contact.name.toString(),
            style: const TextStyle(fontSize: 18.00),
          ),
        ),
        subtitle: Text(
          contact.number.toString(),
          style: const TextStyle(fontSize: 16.00),
        ),
      ),
    );
  }
}
