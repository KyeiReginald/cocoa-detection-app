import 'package:flutter/material.dart';
import 'package:helloworld/models/constants.dart';
import 'package:helloworld/service/contact_list.dart';

class ContactOfficers extends StatelessWidget {
  const ContactOfficers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ContactList.contacts.length,
      itemBuilder: (context, index) {
        final student = ContactList.contacts[index];
        return Card(
          color: primaryColor,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(student.imageUrl),
            ),
            title: Text(student.name,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.email, style: textSize),
                const SizedBox(height: 4),
                Text(student.phoneNumber, style: textSize),
              ],
            ),
          ),
        );
      },
    );
  }
}
