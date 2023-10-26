import 'package:contact_list/model/contacts.dart';
import 'package:flutter/material.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key, required this.contactItem});

  final ContactInfo contactItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 120,
        leading: TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
            label: const Text(
              'Contacts',
              style: TextStyle(color: Colors.blue),
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 64,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundImage: contactItem.imageFile != null
                    ? FileImage(contactItem.imageFile!)
                    : null,
                child: Text(
                  contactItem.imageFile == null
                      ? contactItem.firstName[0].toUpperCase()
                      : '',
                  style: const TextStyle(color: Colors.black, fontSize: 60),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                contactItem.firstName,
                style: const TextStyle(fontSize: 30, color: Colors.white70),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black54),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Phone',
                      style: TextStyle(
                          color:  Color.fromARGB(206, 255, 255, 255),
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      contactItem.contactNumber,
                      style: const TextStyle(fontSize: 25, color: Colors.blue),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(
                      4), 
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  contactItem.emergencyContact
                      ? 'Remove from emergency contacts'
                      : 'Add to emergency contacts',
                  style: TextStyle(
                      color: contactItem.emergencyContact
                          ? Colors.red
                          : Colors.blue,
                      fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
