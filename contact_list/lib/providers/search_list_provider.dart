import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUserController extends StateNotifier<String> {
  SearchUserController() : super('');


  void onSearchUser(String query) {
    state = query;

  }

  // void filterContacts() {
  //   if (currentQuery.isNotEmpty) {
  //     final filteredList = allContactList
  //         .where((contactItem) =>
  //             '${contactItem.firstName} ${contactItem.lastName}'
  //                 .toLowerCase()
  //                 .contains(currentQuery.toLowerCase()))
  //         .toList();
  //     state = filteredList;
  //   } else {
  //     state = allContactList;
  //   }
  }


final searchListProvider = StateNotifierProvider<SearchUserController, String>((ref) {
  return SearchUserController();
});
