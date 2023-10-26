import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/contactList_provider.dart';
import 'package:contact_list/screen/contact_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact_list/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactItem extends ConsumerWidget {
  ContactItem(
      {super.key,
      required this.contactItem,
      required this.index,
      required this.screen});

  ContactInfo contactItem;
  int index;
  String screen;

  void navigateToContactDetails(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => ContactDetailsScreen(contactItem: contactItem),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String fullName = contactItem.firstName;
    if (contactItem.lastName != null) {
      fullName = "${contactItem.firstName} ${contactItem.lastName!}";
    }
    final contactList = screen == 'contacts'
        ? ref.watch(contactListProvider)
        : ref.watch(emergencyListProvider);
    bool isEmergencyContact = contactList[index].emergencyContact;

    return Container(
      alignment: Alignment.topLeft,
      height: 50,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 0),
        onTap: () => navigateToContactDetails(context),
        shape: const Border(
          bottom: BorderSide(color: Colors.white54, width: 0.3),
        ),
        title: Text(
          fullName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  ref
                      .read(contactListProvider.notifier)
                      .onToggleEmergencyContact(contactItem);
                },
                icon: Icon(
                  isEmergencyContact
                      ? Icons.emergency
                      : Icons.emergency_outlined,
                  color: isEmergencyContact ? Colors.red : null,
                ),
              ),
              IconButton(
                onPressed: () {
                  ref
                      .read(contactListProvider.notifier)
                      .onToggleDeleteContact(contactItem, index);
                },
                icon: const Icon(Icons.delete_outline),
              )
            ],
          ),
        ),
      ),
    );
  }
}
