import 'dart:io';

import 'package:contact_list/widgets/image_picker.dart';
import 'package:flutter/material.dart';

class CreateNewContactScreen extends StatefulWidget {
  const CreateNewContactScreen({super.key});

  @override
  State<CreateNewContactScreen> createState() => _CreateNewContactScreenState();
}

class _CreateNewContactScreenState extends State<CreateNewContactScreen> {
  //Add to emergency contacts
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var _enteredFirstName = '';
    var _enteredLastName = null;
    var _enteredMobileNumber = null;
    File? _selectedImage;
    bool _isEmergencyContact = false;

    void _onSubmit() {
      final _isValid = _formKey.currentState!.validate();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Color.fromRGBO(221, 116, 17, 0.867)),
            )),
        title: const Text('New Contact'),
        actions: [
          TextButton(
              onPressed: _onSubmit,
              child: Text(
                'Done',
                style: TextStyle(color: Color.fromARGB(221, 17, 197, 221)),
              )),
        ],
      ),
      // backgroundColor: Colors.black45,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w100),
                    filled: true,
                    fillColor: Colors.black54,
                    hintText: 'First name',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'First name cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _enteredFirstName = newValue!,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Color.fromARGB(160, 255, 255, 255), fontWeight: FontWeight.w100),
                    filled: true,
                    fillColor: Colors.black54,
                    hintText: 'Last Name',
                  ),
                  onSaved: (newValue) => _enteredLastName = newValue!,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w100),
                    filled: true,
                    fillColor: Colors.black54,
                    hintText: 'Contact Number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value.trim().length != 11) {
                      return 'Please enter a valid contact number';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _enteredFirstName = newValue!,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: Text(
                      'Remove Items form Emergency Contacts',
                      style: TextStyle(),
                      textAlign: TextAlign.left,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
