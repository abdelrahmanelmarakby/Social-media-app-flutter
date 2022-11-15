import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_post_bottom_sheet_controller.dart';

class AddPostBottomSheetView extends GetView<AddPostBottomSheetController> {
  const AddPostBottomSheetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPostBottomSheetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddPostBottomSheetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
