import 'package:flutter/material.dart';

Widget noSearchResult(String searchItem) => Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search, size: 40, color: Colors.white54,),
              const SizedBox(height: 20),
              SizedBox(
                width: 220,
                child: Text(
                  'No results for "$searchItem"',
                  style: const TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  
                ),
              ),
              const SizedBox(height: 10,),
              const Text('Check the spelling or try a new search.', style: TextStyle(color: Colors.white30,),)
            ],
          ),
        ),
      );