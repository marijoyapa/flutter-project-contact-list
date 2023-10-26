import 'package:contact_list/providers/contactList_provider.dart';
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
      builder: (context) => CreateNewContactScreen(),
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
    final contactLists = ref.watch(contactListProvider);
    return Scaffold(
      appBar: AppBar(
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
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: contactLists.length,
              itemBuilder: (context, index) => ContactItem(
                contactItem: contactLists[index],
                index: index,
                screen: 'contacts',
              ),
            ),
    );
  }
}
