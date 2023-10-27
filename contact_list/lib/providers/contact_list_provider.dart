import 'package:contact_list/model/contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_list/data/dummy_data.dart';

class ContactListNotifier extends StateNotifier<List<ContactInfo>> {
  ContactListNotifier() : super(_sortContacts(contactList));

  void onToggleEmergencyContact(ContactInfo contact) {
    final updatedContacts = [...state];

    int index = state.indexOf(contact);

    updatedContacts[index] = ContactInfo(
      firstName: state[index].firstName,
      lastName: state[index].lastName,
      imageFile: state[index].imageFile,
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

  void onAddNewContact(ContactInfo contact) {
    final updated = [...state, contact];
    state = _sortContacts(updated);
  }

  static List<ContactInfo> _sortContacts(List<ContactInfo> contacts) {
    return List.from(contacts)..sort((a, b) => a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase()));
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
