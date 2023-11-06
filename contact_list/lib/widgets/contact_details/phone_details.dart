import 'package:flutter/material.dart';

Widget phoneDetailsContainer(BuildContext context, String phoneNum) =>
    Container(
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
            'Phone',
            style: TextStyle(
                color: Theme.of(context).iconTheme.color, fontSize: 13),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            phoneNum,
            style: const TextStyle(fontSize: 20, color: Colors.blue),
          )
        ],
      ),
    );
