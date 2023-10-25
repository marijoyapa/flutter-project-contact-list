import 'package:contact_list/providers/contactList_provider.dart';
import 'package:contact_list/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmergencyList extends ConsumerWidget {
   const EmergencyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emergencyList = ref.watch(emergencyListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency list'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: emergencyList.length,
        itemBuilder: (context, index) =>
            ContactItem(contactItem: emergencyList[index], index: index, screen: 'emergency'),
      ),
    );
  }
}
