import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import "package:firebase_core/firebase_core.dart" as firebase_core;

import '../../../../core/global/var.dart';
import '../../../../core/resourses/color_manger.dart';
import '../../../../core/services/contacts_service.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  int currentPage = 1;
  late PageController pageController;

  String countryCode = '';
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    user.bindStream(auth.authStateChanges());
  }

  //next page
  void nextPage() async {
    await pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  ///////////////////////////////// OTP /////////////////////////////////
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  bool isPhoneOk = false;
  String fullNumber = '';
  TextEditingController otp = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  var auth = FirebaseAuth.instance;

  final Rxn<User> user = Rxn<User>();

  // ignore: prefer_typing_uninitialized_variables
  var onTapRecognizer;

  //*FIRESTORAGE OPS
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
      return downloadURL;
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      Get.snackbar("Can't upload profile pic", e.message.toString());
    }
    return null;
  }

  //***************************OTP******************************************************************/

  // ..text = "123456";

  StreamController<ErrorAnimationType>? errorController;

  RxBool hasError = false.obs;
  RxString currentText = "".obs;

  verifyPhone(String phone) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 120),
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential) {
          // ignore: avoid_print
          print("Login Successfully");
          if (auth.currentUser != null) {
            authUserID = auth.currentUser!.uid;
            isLoading.value = false;
            authStatus.value = "login successfully";
            nextPage();
          }
        },
        verificationFailed: (authException) {
          Get.snackbar("Couldn't send verification message",
              authException.message.toString());
        },
        codeSent: (String id, [int? forceResent]) {
          // ignore: avoid_print
          print("Code Sent $id");

          isLoading.value = false;
          // ignore: unnecessary_this
          this.verId = id;

          authStatus.value = "login successfully";
        },
        codeAutoRetrievalTimeout: (String id) {
          verId = id;
        });
  }

  /////////
  Future<bool> otpVerify(String otp) async {
    isLoading.value = true;
    try {
      BotToast.showLoading();
      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: verId, smsCode: otp));
      if (userCredential.user != null) {
        isLoading.value = false;
        UserService.myUser = await UserService()
            .addUser(
                user: SocialMediaUser(
          uid: userCredential.user?.uid,
          firstName: firstName.text,
          email: userCredential.user?.email,
          photoUrl: imageUploadedUrl,
          phoneNumber: userCredential.user!.phoneNumber,
          lastName: lastName.text,
          following: [],
          followers: [],
          address: '',
        ))
            .then((user) async {
          if (user.uid != null) {
            await ContactsService.getAllRegisterdContacts();
            authUserID = user.uid!;
            Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
          }
          BotToast.closeAllLoading();
          return user;
        });
      }
    } on Exception catch (e) {
      BotToast.closeAllLoading();
      Get.snackbar("otp info", " ${e.toString()}");
    }
    return false;
  }
}
