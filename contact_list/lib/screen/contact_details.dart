import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:contact_list/screen/edit_contact.dart';
import 'package:contact_list/widgets/contact_details/action_icon.dart';
import 'package:contact_list/widgets/contact_details/emergency_contact.dart';
import 'package:contact_list/widgets/contact_details/notes_details.dart';
import 'package:contact_list/widgets/contact_details/phone_details.dart';
import 'package:contact_list/widgets/contact_details/profile_avatar.dart';
import 'package:contact_list/widgets/contact_list/contact_item.dart';
import 'package:contact_list/widgets/create_contact/set_emergency_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactDetailsScreen extends ConsumerStatefulWidget {
  const ContactDetailsScreen({super.key, required this.contactItem});

  final ContactInfo contactItem;

  @override
  ConsumerState<ContactDetailsScreen> createState() =>
      _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends ConsumerState<ContactDetailsScreen> {
  bool isEmergencyContact = false;
  bool isInitialSet = false;
  @override
  void initState() {
    isEmergencyContact = widget.contactItem.emergencyContact;
    isInitialSet = widget.contactItem.emergencyContact;
    super.initState();
  }

  onToggleEmergencyContact() {
    setState(() {
      isEmergencyContact = !isEmergencyContact;
    });
  }

  onClickEdit() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            EditContactScreen(contactItem: widget.contactItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String fullName = widget.contactItem.firstName;
    if (widget.contactItem.lastName != null) {
      fullName =
          "${widget.contactItem.firstName} ${widget.contactItem.lastName!}";
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 120,
        leading: TextButton.icon(
          onPressed: () {
            if (isInitialSet != isEmergencyContact) {
              print('true');
              ref
                  .read(contactListProvider.notifier)
                  .onToggleEmergencyContact(widget.contactItem);
            }
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          label: const Text(
            'Contacts',
            style: TextStyle(color: Colors.blue),
          ),
          style: TextButton.styleFrom(padding: const EdgeInsets.only(left: 0)),
        ),
        actions: [
          TextButton(
              onPressed: onClickEdit,
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileAvatar(context, widget.contactItem),
              const SizedBox(height: 16),
              Text(
                fullName,
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.7)),
              ),
              const SizedBox(height: 20),
              ActionIcons(
                numberList: widget.contactItem.contactNumber,
              ),
              const SizedBox(height: 50),
              phoneDetailsContainer(context, widget.contactItem.contactNumber),
              const SizedBox(height: 12),
              notesDetailsContainer(context),
              const SizedBox(height: 12),
              setEmergencyContactButton(
                  onTap: onToggleEmergencyContact,
                  context: context,
                  isEmergencyContact: isEmergencyContact)
            ],
          ),
        ),
      ),
    );
  }
}
