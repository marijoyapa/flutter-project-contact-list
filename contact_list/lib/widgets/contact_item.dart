import 'package:contact_list/model/contacts.dart';
import 'package:flutter/material.dart';
import 'package:contact_list/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactItem extends ConsumerStatefulWidget {
  ContactItem({super.key, required this.contactItem});

  ContactInfo contactItem;

  @override
  ConsumerState<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends ConsumerState<ContactItem> {
  bool? _isEmergencyContact;
  @override
  void initState() {
    super.initState();
    _isEmergencyContact = widget.contactItem.emergencyContact;
  }

  void _setEmergencyContact() {
    setState(() {
      _isEmergencyContact = !_isEmergencyContact!;

      final int index = contactList.indexOf(widget.contactItem);
      contactList[index] = ContactInfo(
        firstName: widget.contactItem.firstName,
        imageUrl: widget.contactItem.imageUrl,
        contactNumber: widget.contactItem.contactNumber,
        emergencyContact: _isEmergencyContact,
      );
    });
  }

  void _removeContact() {
    setState(() {
      // final int index = contactList.indexOf(widget.contactItem);
      bool isRemoved = contactList.remove(widget.contactItem);
      print(isRemoved);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      shape: const Border(
        bottom: BorderSide(color: Colors.black54),
      ),
      title: Text(widget.contactItem.firstName),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: _setEmergencyContact,
              icon: Icon(_isEmergencyContact == true
                  ? Icons.emergency
                  : Icons.emergency_outlined),
            ),
            IconButton(
              onPressed: _removeContact,
              icon: const Icon(Icons.delete_outline),
            )
          ],
        ),
      ),
    );
  }
}
