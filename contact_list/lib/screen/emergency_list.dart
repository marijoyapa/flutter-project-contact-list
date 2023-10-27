import 'package:contact_list/providers/contact_list_provider.dart';
import 'package:contact_list/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmergencyList extends ConsumerWidget {
  const EmergencyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emergencyList = ref.watch(emergencyListProvider);

    Widget content = const Center(
      child: Text(
        'No emergency contact added.',
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
