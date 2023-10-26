import 'dart:io';

import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/contactList_provider.dart';
import 'package:contact_list/widgets/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNewContactScreen extends ConsumerStatefulWidget {
  const CreateNewContactScreen({super.key});

  @override
  ConsumerState<CreateNewContactScreen> createState() =>
      _CreateNewContactScreenState();
}

class _CreateNewContactScreenState
    extends ConsumerState<CreateNewContactScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController enteredFirstName = TextEditingController();
  TextEditingController enteredLastName = TextEditingController();
  TextEditingController enteredPhoneNumber = TextEditingController();
  File? _selectedImage;
  bool isEmergencyContact = false;
  ContactInfo? newContact;
  bool isFormValid = false;

  bool _onSubmit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    newContact = ContactInfo(
      firstName: enteredFirstName.text,
      lastName: enteredLastName.text,
      contactNumber: enteredPhoneNumber.text,
      imageFile: _selectedImage,
      emergencyContact: isEmergencyContact,
    );

    Navigator.of(context).pop();
    return true;
  }

  void validateForm(String value) {
    if (enteredFirstName.text.trim().isNotEmpty &&
        enteredPhoneNumber.text.trim().isNotEmpty) {
      setState(() {
        isFormValid = true;
      });
    } else {
      setState(() {
        isFormValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: const Text('New Contact'),
        actions: [
          TextButton(
            onPressed: () {
              if (isFormValid) {
                _onSubmit();
                ref
                    .read(contactListProvider.notifier)
                    .onAddNewContact(newContact!);
              } else {
                null;
              }
            },
            child: Text(
              'Done',
              style: TextStyle(
                  color: isFormValid ? Colors.blue : Colors.white30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserImagePicker(
                    onPickImage: (pickedImage) => _selectedImage = pickedImage),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onChanged: validateForm,
                  controller: enteredFirstName,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromARGB(160, 255, 255, 255),
                      fontWeight: FontWeight.w100,
                      fontSize: 17,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    hintText: 'First name',
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'First name cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: validateForm,
                  controller: enteredLastName,
                  decoration:  InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(160, 255, 255, 255),
                      fontWeight: FontWeight.w100,
                      fontSize: 17,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    hintText: 'Last Name',
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  onChanged: validateForm,
                  controller: enteredPhoneNumber,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(160, 255, 255, 255),
                        fontWeight: FontWeight.w100,
                        fontSize: 17),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    hintText: 'Contact Number',
                  ),
                  style: const TextStyle(color: Colors.blue, fontSize: 18),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Contact number cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEmergencyContact = !isEmergencyContact;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isEmergencyContact
                          ? 'Remove from emergency contacts'
                          : 'Add to emergency contacts',
                      style: TextStyle(
                          color: isEmergencyContact ? Colors.red : Colors.blue,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
