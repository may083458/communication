import 'package:contact_service/pages/contact-details.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<Contact> contacts;
  Function() reloadContacts;
  ContactsList({Key? key, required this.contacts, required this.reloadContacts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];

          return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ContactDetails(
                      contact,
                      onContactDelete: (Contact _contact) {
                        reloadContacts();
                        Navigator.of(context).pop();
                      },
                      onContactUpdate: (Contact _contact) {
                        reloadContacts();
                      },
                    )
                ));
              },
              // title: Text('${contact.displayName}'),
              // subtitle: Text('${contact.phones?.elementAt(0).value}'),
              title: Text("Hello"),
              //leading: ContactAvatar(contact, 36)
          );
        },
      ),
    );
  }
}
