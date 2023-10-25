import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/contactList_provider.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String fullName = contactItem.firstName;
    if (contactItem.lastName != null) {
      fullName = contactItem.firstName + " " + contactItem.lastName!;
    }
    final contactList = screen == 'contacts'
        ? ref.watch(contactListProvider)
        : ref.watch(emergencyListProvider);
    bool isEmergencyContact = contactList[index].emergencyContact;

    void toPrint() {
      print(isEmergencyContact);
      print(index);
    }

    return ListTile(
      contentPadding: EdgeInsets.only(right: 0),
      onTap: toPrint,
      shape: const Border(
        bottom: BorderSide(color: Colors.black54),
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
                    .onToggleEmergencyContact(contactItem, index);
              },
              icon: Icon(
                isEmergencyContact ? Icons.emergency : Icons.emergency_outlined,
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
    );
  }
}
