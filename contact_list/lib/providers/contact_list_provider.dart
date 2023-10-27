import 'package:contact_list/model/contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_list/data/dummy_data.dart';

class ContactListNotifier extends StateNotifier<List<ContactInfo>> {
  ContactListNotifier() : super(contactList);

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
    state = [...state, contact];
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
