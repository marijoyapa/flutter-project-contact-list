import 'package:contact_list/providers/contactList_provider.dart';
import 'package:contact_list/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmergencyList extends ConsumerWidget {
  EmergencyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = const Center(
      child: Text(
        'No emergency contact added.',
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );
    final emergencyList = ref.watch(emergencyListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Emergency List')),
      ),
      body: emergencyList.isEmpty
          ? content
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: emergencyList.length,
              itemBuilder: (context, index) => ContactItem(
                  contactItem: emergencyList[index],
                  index: index,
                  screen: 'emergency'),
            ),
    );
  }
}
