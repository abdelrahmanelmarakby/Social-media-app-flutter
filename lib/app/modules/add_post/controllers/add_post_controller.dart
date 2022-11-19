import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  late TextEditingController postEditingController;
  Rx<File> image = Rx<File>(File(""));
  String imageUrl = '';
  addImageToPost(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: imageSource, imageQuality: 100);
    final pickedFile = await imagePicker.pickImage(source: imageSource);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);

      FirebaseStorage.instance
          .ref()
          .child('postImages/${UserService.myUser!.uid}/${DateTime.now()}')
          .putFile(File(pickedFile.path));

      imageUrl = await FirebaseStorage.instance
          .ref()
          .child('postImages/${UserService.myUser!.uid}/${DateTime.now()}')
          .getDownloadURL();
      update();
      return imageUrl;
    }
  }

  @override
  void onInit() {
    postEditingController = TextEditingController();

    super.onInit();
  }
}
