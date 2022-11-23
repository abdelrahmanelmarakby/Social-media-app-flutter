import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:get/get.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:intl/intl.dart';

class AddPostController extends GetxController {
  late TextEditingController postEditingController;
  Rx<File> image = Rx<File>(File(""));
  RxString imageUrl = ''.obs;
  addImageToPost(ImageSource imageSource) async {
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
    final pickedFile =
        await imagePicker.pickImage(source: imageSource).then((value) {
      return image.value = File(value!.selectedFiles.first.selectedFile.path);
    });

    print(pickedFile.path);
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
    return imageUrl.value == "";
  }

  @override
  void onInit() {
    postEditingController = TextEditingController();

    super.onInit();
  }
}
