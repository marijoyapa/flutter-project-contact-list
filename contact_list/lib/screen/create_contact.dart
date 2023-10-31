import 'dart:io';

import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/model/number.dart';
import 'package:contact_list/providers/contact_list_provider.dart';
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
  TextEditingController enteredFirstName = TextEditingController();
  TextEditingController enteredLastName = TextEditingController();
  TextEditingController enteredPhoneNumber = TextEditingController();
  File? _selectedImage;
  bool isEmergencyContact = false;
  ContactInfo? newContact;
  bool isFormValid = false;
  NumberTypes numTypeSelected = NumberTypes.Phone;

  void _onSubmit() {
    newContact = ContactInfo(
      firstName: enteredFirstName.text,
      lastName: enteredLastName.text,
      contactNumber: enteredPhoneNumber.text,
      imageFile: _selectedImage,
      emergencyContact: isEmergencyContact,
    );

    Navigator.of(context).pop();
  }

  void validateForm(String value) {
    if (enteredFirstName.text.trim().isNotEmpty &&
        enteredPhoneNumber.text.trim().isNotEmpty &&
        !enteredPhoneNumber.text.contains(RegExp(r'[a-zA-Z]'))) {
      setState(() {
        isFormValid = true;
      });
    } else {
      setState(() {
        isFormValid = false;
      });
    }
  }

  InputDecoration textFieldInputDecoration(String text) {
    return InputDecoration(
      hintText: text,
      hintStyle: const TextStyle(
        color: Color.fromARGB(160, 255, 255, 255),
        fontWeight: FontWeight.w100,
        fontSize: 16,
      ),
      contentPadding: const EdgeInsets.only(left: 0, bottom: 0),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: .3,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: .3,
        ),
      ),
    );
  }

  Widget inputTextField({
    required TextEditingController controller,
    required String fieldName,
    required TextInputType textInputype,
  }) =>
      Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
            onChanged: validateForm,
            controller: controller,
            keyboardType: textInputype,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.left,
            scrollPadding: const EdgeInsets.only(left: 0),
            decoration: textFieldInputDecoration(fieldName)),
      );

  Widget inputContactNumber() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(color: Colors.white54, width: 0.3),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 0),
              width: 90,
              child: Row(
                children: [
                  SizedBox(
                    width: 51,
                    child: Text(
                      numTypeSelected.name,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next,
                    color: Colors.white54,
                    size: 28,
                  )
                ],
              ),
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => Dialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 5),
                backgroundColor: const Color.fromARGB(255, 28, 28, 30),
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: NumberTypes.values
                        .map(
                          (type) => RadioListTile(
                            dense: true,
                            value: type,
                            groupValue: numTypeSelected,
                            onChanged: (val) {
                              setState(() {
                                numTypeSelected = val!;
                              });
                              Navigator.of(context).pop();
                            },
                            title: Text(type.name),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            width: 0.3,
            color: const Color.fromARGB(137, 240, 233, 233),
          ),
          Expanded(
            child: inputTextField(
                controller: enteredPhoneNumber,
                fieldName: numTypeSelected.name,
                textInputype: TextInputType.number),
          ),
        ],
      ),
    );
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserImagePicker(
                  onPickImage: (pickedImage) => _selectedImage = pickedImage),
              const SizedBox(height: 16),
              inputTextField(
                  controller: enteredFirstName,
                  fieldName: 'First Name',
                  textInputype: TextInputType.text),
              inputTextField(
                  controller: enteredLastName,
                  fieldName: 'Last Name',
                  textInputype: TextInputType.text),
              const SizedBox(height: 32),
              // const SizedBox(height: 16),
              // inputContactNumber(),
              ListView.builder(itemBuilder: (context, index) => ,
                children: [inputContactNumber(), inputContactNumber(), inputContactNumber()],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle,
                    color: Color.fromARGB(255, 101, 199, 100),
                  ),
                  label: Text(
                    'Add phone',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 12),
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
    );
  }
}
