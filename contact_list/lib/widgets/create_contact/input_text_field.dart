import 'package:flutter/material.dart';

Widget inputTextField(
    {required TextEditingController controller,
    required String fieldName,
    required TextInputType textInputype,
    required BuildContext context,
    required Function(String value) validateForm,
    bool border = false}) {
  return Container(
    color: Theme.of(context).colorScheme.primaryContainer,
    padding: const EdgeInsets.only(left: 10),
    child: TextField(
        onChanged: validateForm,
        controller: controller,
        keyboardType: textInputype,
        style: TextStyle(
            color: Theme.of(context).iconTheme.color!.withOpacity(1),
            fontSize: 16),
        textAlign: TextAlign.left,
        scrollPadding: const EdgeInsets.only(left: 0),
        decoration: textFieldInputDecoration(fieldName, context, border)),
  );
}

InputDecoration textFieldInputDecoration(
        String text, BuildContext context, bool border) =>
    InputDecoration(
      hintText: text,
      hintStyle: TextStyle(
        color: Theme.of(context).iconTheme.color,
        fontWeight: FontWeight.w100,
        fontSize: 16,
      ),
      contentPadding: const EdgeInsets.only(left: 0, bottom: 0),
      enabledBorder: UnderlineInputBorder(
          borderSide: border
              ? const BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                )
              : BorderSide.none),
      focusedBorder: UnderlineInputBorder(
          borderSide: border
              ? const BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                )
              : BorderSide.none),
    );
