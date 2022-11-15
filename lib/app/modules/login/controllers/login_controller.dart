import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/global/var.dart';
import '../../../data/remote_firebase_services/user_services.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  int currentPage = 1;
  late PageController pageController;
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  bool isPhoneOk = false;
  String fullNumber = '';

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otp = TextEditingController();
  var auth = FirebaseAuth.instance;

  final Rxn<User> user = Rxn<User>();

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

  StreamController<ErrorAnimationType>? errorController;

  RxBool hasError = false.obs;
  RxString currentText = "".obs;

  verifyPhone(String phone) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 70),
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
          Get.log(authException.message.toString());
        },
        codeSent: (String id, [int? forceResent]) {
          // ignore: avoid_print
          print("Code Sent $id");

          isLoading.value = false;
          // ignore: unnecessary_this
          this.verId = id;
          nextPage();
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
      // ignore: avoid_print
      print("trying to verify");

      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: verId, smsCode: otp));
      if (userCredential.user != null) {
        isLoading.value = false;
        UserService.myUser = await UserService()
            .getProfile(userCredential.user?.uid ?? "")
            .then((user) {
          if (user.uid != null) {
            authUserID = user.uid!;
            Get.log("User added : ${user.toString()} ");
            Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
          }
          return user;
        });
      }
    } on Exception catch (e) {
      Get.snackbar("otp info", " ${e.toString()}");
    }
    return false;
  }
}
