import 'package:contact_list/main.dart';
import 'package:contact_list/screen/contact_list.dart';
import 'package:contact_list/screen/emergency_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  var _currentIndex = 0;

  void _selectScreen(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: theme,
        home: Scaffold(
    
          body: _currentIndex == 0 ? const ContactList() : const EmergencyList(),
          bottomNavigationBar: BottomNavigationBar(
            
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white54,
            backgroundColor: const Color.fromARGB(137, 88, 85, 85),
            onTap: _selectScreen,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_emergency), label: 'Emergency List'),
            ],
          ),
        ),
      ),
    );
  }
}
