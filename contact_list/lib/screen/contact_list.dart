import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:contact_list/providers/search_list_provider.dart';
import 'package:contact_list/screen/create_contact.dart';
import 'package:contact_list/widgets/contact_item.dart';
import 'package:contact_list/widgets/search_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactList extends ConsumerWidget {
  ContactList({super.key});

  TextEditingController searchKeyword = TextEditingController();
  final container = ProviderContainer();

  void _navigateToCreateContact(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const CreateNewContactScreen(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactLists = ref.watch(filteredListProvider);
    final searchItem = ref.watch(searchKeywordProvider);
    searchKeyword.text = searchItem;

    Widget content = const Expanded(
      child:  Center(
        child: Text(
          'No contact list added.',
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ),
    );

    if (contactLists.isEmpty && searchItem.trim().isNotEmpty) {
      content = const Expanded(
        child:  Center(
          child: Text(
            'Try searching another user',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Center(child: Text('Contacts')),
        actions: [
          IconButton(
            onPressed: () {
              _navigateToCreateContact(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          searchContainer(
              context: context,
              searchController: searchKeyword,
              onChangedSearchText: (value) {
                ref.read(searchKeywordProvider.notifier).onSearchUser(value);
              },
              onClickClose: () {
                ref.read(searchKeywordProvider.notifier).onSearchUser('');
              }),
          contactLists.isEmpty
              ? content
              : Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: contactLists.length,
                    itemBuilder: (context, index) => ContactItem(
                      contactItem: contactLists[index],
                      index: index,
                      screen: 'contacts',
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
