import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddPostController extends GetxController {
  late TextEditingController postEditingController;
  Rx<File> image = Rx<File>(File(""));
  RxString imageUrl = ''.obs;
  Future<bool?> addImageToPost(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(
      source: imageSource,
      imageQuality: 100,
    );
    final pickedFile = await imagePicker.pickImage(source: imageSource);
    image.value = File(pickedFile?.path ?? "");
    return true;
  }

  Future<bool> uploadPost() async {
    DateTime now = DateTime.now();
    var datestamp = DateFormat("yyyyMMdd'T'HHmmss");
    String currentdate = datestamp.format(now);
    final Reference ref = FirebaseStorage.instance
        .ref()
        .child('postImages')
        .child(UserService.myUser!.uid ?? "")
        .child(currentdate);
    UploadTask task = ref.putFile(image.value);
    await task.whenComplete(() async {
      imageUrl.value = await ref.getDownloadURL();
    });
    return imageUrl.value != null || imageUrl.value == "";
  }

  @override
  void onInit() {
    postEditingController = TextEditingController();

    super.onInit();
  }
}
