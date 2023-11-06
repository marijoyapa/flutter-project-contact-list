import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/widgets/action_icon.dart';
import 'package:flutter/material.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key, required this.contactItem});

  final ContactInfo contactItem;

  @override
  Widget build(BuildContext context) {
    String fullName = contactItem.firstName;
    if (contactItem.lastName != null) {
      fullName = "${contactItem.firstName} ${contactItem.lastName!}";
    }
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
          ),
          style: TextButton.styleFrom(padding: EdgeInsets.only(left: 0)),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5),
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
                  style:  TextStyle( fontSize: 60, color: Theme.of(context).iconTheme.color),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                fullName,
                style: TextStyle(fontSize: 25, color: Theme.of(context).iconTheme.color!.withOpacity(0.7)),
              ),
              const SizedBox(height: 20),
              ActionIcons(ctx: context),
              const SizedBox(height: 50),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                      'Phone',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      contactItem.contactNumber[0].digit,
                      style: const TextStyle(fontSize: 20, color: Colors.blue),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 13),
                    ),
                    SizedBox(
                      height: 40,
                    ),
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
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
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
