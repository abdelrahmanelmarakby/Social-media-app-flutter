import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:get/get.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:intl/intl.dart';

import '../../../data/remote_firebase_services/user_services.dart';

class AddStoryController extends GetxController {
  late TextEditingController postEditingController;
  File image = File("");
  RxString imageUrl = ''.obs;
  Future<String> addImageToStory(ImageSource imageSource) async {
    ImagePickerPlus imagePicker = ImagePickerPlus(Get.context!);
    imagePicker.pickImage(
      source: imageSource,
      multiImages: false,
      galleryDisplaySettings: GalleryDisplaySettings(
        appTheme: AppTheme(
          primaryColor: ColorsManger.primary,
        ),
        cropImage: true,
        showImagePreview: true,
        tabsTexts: TabsTexts(),
      ),
    );
    final pickedFile = await imagePicker.pickImage(source: imageSource);
    if (pickedFile != null) {
      DateTime now = DateTime.now();
      var datestamp = DateFormat("yyyyMMdd'T'HHmmss");
      String currentdate = datestamp.format(now);
      image = File(pickedFile.selectedFiles.first.selectedFile.path);
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
