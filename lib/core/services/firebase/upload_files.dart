import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import "package:firebase_core/firebase_core.dart" as firebase_core;

import '../../global/var.dart';

class UploadServices {
  final picker = ImagePicker();
  late final File image;
  Future<String?> pickImage({String type = ""}) async {
    try {
      final pickedFile = await picker.pickImage(
          source: ImageSource.gallery, maxHeight: 750, maxWidth: 750);
      image = File(pickedFile!.path);
      //imagePicked.value = true;
      Get.forceAppUpdate();
      return await uploadFile(type: type);
    } on FirebaseException catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> uploadFile({String type = ""}) async {
    File file = File(image.path);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/${"$authUserID$type"}.png')
          .putFile(file);

      //return image link
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('images/${"${file.path + authUserID}profilePic"}.png')
          .getDownloadURL();
      //  imageUploadedUrl = downloadURL;
      return downloadURL;
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      Get.snackbar("Can't upload profile pic", e.message.toString());
    }
    return null;
  }
}
