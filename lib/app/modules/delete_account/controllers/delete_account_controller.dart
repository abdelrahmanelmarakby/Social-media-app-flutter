import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  RxBool isButtonActive = false.obs;
  TextEditingController deleteController = TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  deleteAccount() {
    if (isButtonActive.value == true) {
      UserService().deleteUser(UserService.myUser?.uid ?? "");
    }
  }
}
