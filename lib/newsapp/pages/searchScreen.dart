import 'package:flutter/material.dart';

var searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'search must be not empty';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                // border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
