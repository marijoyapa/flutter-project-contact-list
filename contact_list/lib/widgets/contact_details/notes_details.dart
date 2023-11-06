import 'package:flutter/material.dart';

Widget notesDetailsContainer(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notes',
            style: TextStyle(
                color: Theme.of(context).iconTheme.color, fontSize: 13),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
