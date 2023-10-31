import 'package:flutter/material.dart';

Widget inputTextField({
  required TextEditingController controller,
  required String fieldName,
  required TextInputType textInputype,
  required BuildContext context,
  required Function(String value) validateForm,
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

InputDecoration textFieldInputDecoration(String text) => InputDecoration(
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
          width: 0.2,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
    );