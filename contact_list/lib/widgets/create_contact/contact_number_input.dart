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
}) {
  return Container(
    width: double.infinity,
    height: 48,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      border: Border.all(color: Theme.of(context).iconTheme.color!.withOpacity(0.2), width: 0.2),
    ),
    child: Row(
      children: [
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 0),
            width: 100,
            child: Row(
              children: [
                SizedBox(
                  width: 51,
                  child: Text(
                    numTypeSelected[index].name,
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 12,
                    ),
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  color: Theme.of(context).iconTheme.color,
                  size: 28,
                )
              ],
            ),
          ),
          onTap: () => showDialog(
            context: context,
            builder: (context) => Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 5),
              backgroundColor: Theme.of(context).primaryColor,
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
          color: Theme.of(context).iconTheme.color,
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
