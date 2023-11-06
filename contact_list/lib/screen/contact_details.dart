import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/widgets/contact_details/action_icon.dart';
import 'package:contact_list/widgets/contact_details/emergency_contact.dart';
import 'package:contact_list/widgets/contact_details/notes_details.dart';
import 'package:contact_list/widgets/contact_details/phone_details.dart';
import 'package:contact_list/widgets/contact_details/profile_avatar.dart';
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
          style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 0)),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileAvatar(context, contactItem),
              const SizedBox(height: 16),
              Text(
                fullName,
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.7)),
              ),
              const SizedBox(height: 20),
              ActionIcons(ctx: context),
              const SizedBox(height: 50),
              phoneDetailsContainer(
                  context, contactItem.contactNumber[0].digit),
              const SizedBox(height: 12),
              notesDetailsContainer(context),
              const SizedBox(height: 12),
              emergencyContactLabel(context, contactItem.emergencyContact),
             
            ],
          ),
        ),
      ),
    );
  }
}
