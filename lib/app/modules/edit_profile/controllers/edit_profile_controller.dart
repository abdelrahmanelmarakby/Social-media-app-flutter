import 'dart:io';

import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/global/var.dart';
import 'package:get/get.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import "package:firebase_core/firebase_core.dart" as firebase_core;

import '../../../../core/resourses/color_manger.dart';

class EditProfileController extends GetxController {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final RxBool imagePicked = false.obs;
  late File image;
  String imageUploadedUrl = '';

  Future pickImage() async {
    ImagePickerPlus imagePicker = ImagePickerPlus(Get.context!);

    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
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
    image = File(pickedFile!.selectedFiles.first.selectedFile.path);
    imagePicked.value = true;

    Get.forceAppUpdate();
    uploadFile();
  }

  Future<String?> uploadFile({String type = "profilePic"}) async {
    File file = File(image.path);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/${"${file.path + authUserID}$type"}.png')
          .putFile(file);

      //return image link
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('images/${"${file.path + authUserID}profilePic"}.png')
          .getDownloadURL();
      imageUploadedUrl = downloadURL;
      UserService().updateUser(
          user: UserService.myUser!.copyWith(photoUrl: downloadURL));
      return downloadURL;
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      Get.snackbar("Can't upload profile pic", e.message.toString());
    }
    return null;
  }
}
