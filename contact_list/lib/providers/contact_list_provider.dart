import 'package:contact_list/model/contacts.dart';
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

// final searchQuery = StateProvider((ref) => 
//     '' 

// );

// final filteredContactListProvider = Provider<List<ContactInfo>>((ref) {
//   final contact = ref.watch(contactListProvider);
//   final query = ref.watch(contactListProvider.notifier).searchQuery;
//   return contact.where((contactItem) {
//     final fullName =
//         '${contactItem.firstName} ${contactItem.lastName}'.toLowerCase();
//     return fullName.contains(query.toLowerCase());
//   }).toList();
// });
