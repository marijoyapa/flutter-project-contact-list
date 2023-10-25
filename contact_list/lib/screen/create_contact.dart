import 'package:flutter/material.dart';

class CreateNewContactScreen extends StatelessWidget {
  const CreateNewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black87),
            )),
        title: const Text('New Contact'),
        actions: [],
      ),
      // backgroundColor: Colors.black45,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 64, backgroundColor: Colors.grey),
              TextButton(
                onPressed: () {},
                child: const Text('Change photo'),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'First name'),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Contact Number'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Remove Items form Emergency Contacts',
                    textAlign: TextAlign.left,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
