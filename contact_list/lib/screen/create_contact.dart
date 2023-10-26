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
  // TextEditingController _firstNameController = TextEditingController();
  // TextEditingController _numController = TextEditingController();

  TextEditingController _enteredFirstName = TextEditingController();
  TextEditingController _enteredLastName = TextEditingController();
  TextEditingController _enteredMobileNumber = TextEditingController();
  File? _selectedImage;
  bool isEmergencyContact = false;
  ContactInfo? newContact;
  bool isFormValid = false;

  bool _onSubmit() {
    final _isValid = _formKey.currentState!.validate();
    if (!_isValid) {
      return false;
    }
    // _formKey.currentState!.save();
    newContact = ContactInfo(
      firstName: _enteredFirstName.text,
      lastName: _enteredLastName.text,
      contactNumber: _enteredMobileNumber.text,
      imageFile: _selectedImage,
      emergencyContact: isEmergencyContact,
    );

    Navigator.of(context).pop();
    return true;
  }

  void validateForm(String value) {
    if (_enteredFirstName.text.trim().isNotEmpty &&
        _enteredMobileNumber.text.trim().isNotEmpty) {
      // All validations are met.
      setState(() {
        isFormValid = true;
      });
    } else {
      // At least one validation failed.
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
            )),
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
              // return null;
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
          // padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  controller: _enteredFirstName,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromARGB(160, 255, 255, 255),
                      fontWeight: FontWeight.w100,
                      fontSize: 17,
                    ),
                    filled: true,
                    fillColor: Colors.black54,
                    hintText: 'First name',
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'First name cannot be empty';
                    }
                    return null;
                  },
                  // onSaved: (newValue) => _enteredFirstName = newValue!,
                ),
                TextFormField(
                  onChanged: validateForm,
                  controller: _enteredLastName,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromARGB(160, 255, 255, 255),
                      fontWeight: FontWeight.w100,
                      fontSize: 17,
                    ),
                    filled: true,
                    fillColor: Colors.black54,
                    hintText: 'Last Name',
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  // onSaved: (newValue) => _enteredLastName = newValue!,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  onChanged: validateForm,
                  controller: _enteredMobileNumber,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                        color: Color.fromARGB(160, 255, 255, 255),
                        fontWeight: FontWeight.w100,
                        fontSize: 17),
                    filled: true,
                    fillColor: Colors.black54,
                    hintText: 'Contact Number',
                  ),
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Contact number cannot be empty';
                    }
                    return null;
                  },
                  // onSaved: (newValue) => _enteredMobileNumber = newValue,
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
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity, // Adjust to your desired width
                    height: 45, // Adjust to your desired height
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(
                          4), // Adjust to your desired border radius
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
