import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/search_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_list/data/dummy_data.dart';

class ContactListNotifier extends StateNotifier<List<ContactInfo>> {
  ContactListNotifier() : super(_sortContacts(contactList));

  void onToggleEmergencyContact(ContactInfo contact) {


    state = state.map((list) {
      if (list.id == contact.id) {
        return list.copyWith(emergencyContact: !contact.emergencyContact);
      }
      return list;
    }).toList();
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
    return List.from(contacts)
      ..sort((a, b) =>
          a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase()));
  }
}

final contactListProvider =
    StateNotifierProvider<ContactListNotifier, List<ContactInfo>>(
  (ref) => ContactListNotifier(),
);

final emergencyListProvider = Provider<List<ContactInfo>>((ref) {
  final contact = ref.watch(contactListProvider);

  return contact
      .where((contactItem) => contactItem.emergencyContact == true)
      .toList();
});

final filteredListProvider = Provider<List<ContactInfo>>((ref) {
  final contact = ref.watch(contactListProvider);
    final query = ref.watch(searchListProvider);

    if (query.isNotEmpty) {
      final filteredList = contact
          .where((contactItem) =>
              '${contactItem.firstName} ${contactItem.lastName}'
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
      return filteredList;
    } else {
      return contact;
    }
  
});
