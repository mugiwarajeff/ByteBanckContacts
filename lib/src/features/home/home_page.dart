import 'package:flutter/material.dart';
import 'package:my_app/src/features/home/widgets/Contact_item.dart';

import '../../shared/models/contact_model.dart';

class HomePage extends StatelessWidget {
  final String appBarTitle = "Contacts";
  final Contact contact = Contact(name: "jefferson", number: 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Column(children: [ContactItem(contact: contact)]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
