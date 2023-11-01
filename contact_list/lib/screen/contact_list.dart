import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:contact_list/providers/search_list_provider.dart';
import 'package:contact_list/screen/create_contact.dart';
import 'package:contact_list/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactList extends ConsumerWidget {
  ContactList({super.key});

  TextEditingController searchKeyword = TextEditingController();

  void _navigateToCreateContact(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const CreateNewContactScreen(),
    );
  }

  void printController(String value){
    print(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = const Center(
      child: Text(
        'No contact list added.',
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );
    final contactLists = searchKeyword.text.trim().isNotEmpty
        ? ref.watch(searchListProvider)
        : ref.watch(searchListProvider);
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
      body: 
      // contactLists.isEmpty
      //     ? content
      //     : 
          Column(
              children: [
                TextField(
                  controller: searchKeyword,
                  onChanged: (value) {
                    // printController(value);
                    ref.read(searchListProvider.notifier).onSearchUser(value);
                  },
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: const Color.fromARGB(244, 0, 0, 0)),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: InputBorder.none),
                ),
                Expanded(
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
