import 'package:flutter/material.dart';

Widget searchContainer({
  required BuildContext context,
  required TextEditingController searchController,
  required Function(String value) onChangedSearchText,
  required Function() onClickClose,
}) =>
    Container(
      margin: EdgeInsets.only(left: 13, right: 13, bottom: 13),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white54,
            ),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.left,
              controller: searchController,
              onChanged: onChangedSearchText,
              style: const TextStyle(
                color: Colors.white54,
              ),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                contentPadding: EdgeInsets.all(0),
                alignLabelWithHint: true,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: onClickClose,
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white54,
                    size: 20,
                  ),
                  padding: const EdgeInsets.only(right: 20),
                )
              : const SizedBox(),
        ],
      ),
    );
