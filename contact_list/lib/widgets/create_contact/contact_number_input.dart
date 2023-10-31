import 'package:flutter/material.dart';
import 'package:contact_list/model/number.dart';
import 'package:contact_list/widgets/create_contact/input_text_field.dart';

Widget inputContactNumber({
  required int index,
  required BuildContext context,
  required List<NumberTypes> numTypeSelected,
  required List<TextEditingController> phoneController,
  required Function(int i, NumberTypes types) onSelectNumType,
  required Function(String value) validateForm,
}) 
  

{
  return Container(
    width: double.infinity,
    height: 48,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      border: Border.all(color: Colors.white54, width: 0.2),
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
                    numTypeSelected[index].name,
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
                          groupValue: numTypeSelected[index],
                          onChanged: (val) {
                            onSelectNumType(index, val!);
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
          margin: const EdgeInsets.symmetric(vertical: 7),
          width: 0.3,
          color: const Color.fromARGB(137, 240, 233, 233),
        ),
        Expanded(
          child: inputTextField(
            context: context,
              validateForm: validateForm,
              controller: phoneController[index],
              fieldName: numTypeSelected[index].name,
              textInputype: TextInputType.number),
        ),
      ],
    ),
  );
}
