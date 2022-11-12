import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comments_controller.dart';

class CommentsView extends GetView<CommentsController> {
  const CommentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommentsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CommentsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
