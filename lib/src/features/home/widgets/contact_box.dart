import 'package:flutter/material.dart';

import '../../contacts/contact_page.dart';

class ContactBox extends StatelessWidget {
  const ContactBox({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ContactPage()));
      },
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        height: 80,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(
                Icons.people_alt_sharp,
                color: Colors.white,
              ),
              Text(
                "Contacts",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
