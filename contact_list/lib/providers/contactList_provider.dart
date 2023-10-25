import 'package:contact_list/model/contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_list/data/dummy_data.dart';

class ContactListNotifier extends StateNotifier<List<ContactInfo>> {
  ContactListNotifier() : super(contactList);

  void onToggleEmergencyContact(ContactInfo contact, int index) {
    final updatedContacts = [...state];
    updatedContacts[index] = ContactInfo(
      firstName: state[index].firstName,
      imageUrl: state[index].imageUrl,
      contactNumber: state[index].contactNumber,
      emergencyContact: !state[index].emergencyContact,
    );
    state = updatedContacts;
  }

  void onToggleDeleteContact(ContactInfo contact, int index) {
    final updatedContacts = [...state];
    updatedContacts.remove(contact);
    state = updatedContacts;
  }
}

final contactListProvider =
    StateNotifierProvider<ContactListNotifier, List<ContactInfo>>(
  (ref) => ContactListNotifier(),
);

final emergencyListProvider = Provider((ref) {
  final contact = ref.watch(contactListProvider);

  return contact
      .where((contactItem) => contactItem.emergencyContact == true)
      .toList();
});
