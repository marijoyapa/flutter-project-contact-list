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
    // // Navigator.of(context).push(MaterialPageRoute(
    // //   builder: (context) => CreateNewContactScreen(),
    // // ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactLists = ref.watch(contactListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Contact list')),
        actions: [
          IconButton(
            onPressed: () {
              _navigateToCreateContact(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contactLists.length,
        itemBuilder: (context, index) =>
            ContactItem(contactItem: contactLists[index]),
      ),
    );
  }
}
