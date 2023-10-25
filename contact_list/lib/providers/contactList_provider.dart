import 'package:contact_list/model/contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_list/data/dummy_data.dart';

class ContactListNotifier extends StateNotifier<List<ContactInfo>> {
  ContactListNotifier() : super(contactList);

  void _onToggleEmergencyContact(ContactInfo contact) {
    final index = state.indexOf(contact);

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
