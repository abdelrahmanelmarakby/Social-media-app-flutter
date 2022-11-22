import 'package:flutter/material.dart';

class SearchPosts extends StatelessWidget {
  const SearchPosts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        )
      ],
    ));
  }
}
