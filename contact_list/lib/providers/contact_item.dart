import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactListNotifier extends StateNotifier<List<ContactInfo>> {
  ContactListNotifier() : super([]);


}


final allListProvider = Provider<List<ContactInfo>>((ref) {
  final contact = ref.watch(contactListProvider);
  return contact;
});
