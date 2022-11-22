import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../data/remote_firebase_services/user_services.dart';

class AddStoryController extends GetxController {
  late TextEditingController postEditingController;
  File image = File("");
  RxString imageUrl = ''.obs;
  Future<String> addImageToStory(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: imageSource, imageQuality: 100);
    final pickedFile = await imagePicker.pickImage(source: imageSource);
    if (pickedFile != null) {
      DateTime now = DateTime.now();
      var datestamp = DateFormat("yyyyMMdd'T'HHmmss");
      String currentdate = datestamp.format(now);
      image = File(pickedFile.path);
      final Reference ref = FirebaseStorage.instance
          .ref()
          .child('storyImages')
          .child(UserService.myUser!.uid ?? "")
          .child(currentdate);
      UploadTask task = ref.putFile(image);
      await task.whenComplete(() async {
        imageUrl.value = await ref.getDownloadURL();
      });

      return imageUrl.value;
    }
    return imageUrl.value;
  }

  @override
  void onReady() {
    addImageToStory(ImageSource.gallery);
    super.onReady();
  }

  @override
  void onInit() {
    postEditingController = TextEditingController();

    super.onInit();
  }
}
