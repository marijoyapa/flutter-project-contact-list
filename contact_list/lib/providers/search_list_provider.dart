import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchListProvider =
    StateNotifierProvider<SearchUserController, List<ContactInfo>>((ref) {
  return SearchUserController(ref.watch(contactListProvider));
});

class SearchUserController extends StateNotifier<List<ContactInfo>> {
  SearchUserController(this.allContactList) : super(allContactList);

  final List<ContactInfo> allContactList;

  void onSearchUser(String query) {
    if (query.isNotEmpty) {
      print(query);
      final filteredList = allContactList
          .where((contactItem) =>
              '${contactItem.firstName} ${contactItem.lastName}'
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
      state = filteredList;
    } else {
      state = allContactList;
    }
  }
}
