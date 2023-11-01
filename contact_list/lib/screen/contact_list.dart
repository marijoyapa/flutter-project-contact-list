import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:contact_list/screen/create_contact.dart';
import 'package:contact_list/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactList extends ConsumerWidget {
  const ContactList({super.key});

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
    Widget content = const Center(
      child: Text(
        'No contact list added.',
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );
    final contactLists = ref.watch(filteredContactListProvider);
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
      body: contactLists.isEmpty
          ? content
          : Column(
              children: [
                TextField(
                  onChanged: (value) {
                    ref.read(contactListProvider.notifier).setSearchQuery(value);
                    
                  },
                  style: TextStyle(color: Colors.white, backgroundColor: const Color.fromARGB(244, 0, 0, 0)),
                  
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: InputBorder.none
                  ),
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
