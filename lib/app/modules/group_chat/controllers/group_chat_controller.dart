import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/group_chat_model.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/services/chat/group/group_chat.dart';
import 'package:get/get.dart';
import 'package:image_picker_plus/image_picker_plus.dart';

class GroupChatController extends GetxController {
  ////////////////////////////////SELECTEDUSERS ////////////////////////////////
  List<SocialMediaUser?> users = [];
  List<SocialMediaUser?> selectedUsers = [];
  TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void selectUser(SocialMediaUser? user) {
    if (selectedUsers.contains(user)) {
      selectedUsers.remove(user);
    } else {
      selectedUsers.add(user);
    }
    update();
  }

  getUsersByName(List<SocialMediaUser?> users, String searchText) {
    return users.where((element) {
      return (element?.firstName?.toLowerCase().contains(searchText) ??
              false) ||
          (element?.lastName?.toLowerCase().contains(searchText) ?? false) ||
          (element?.phoneNumber?.toLowerCase().contains(searchText) ?? false) ||
          (element?.email?.toLowerCase().contains(searchText) ?? false);
    }).toList();
  }

  ////////////////////////////////ADDCHATDETIALS ////////////////////////////////
  String groupNameController = "";
  File image = File('');
  String imageURL = '';
  Future selectGroupImage() async {
    ImagePickerPlus imagePickerPlus = ImagePickerPlus(Get.context!);
    final pickedFile =
        await imagePickerPlus.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.selectedFiles.first.selectedFile.path);
      update();
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future addGroupChatImage() async {
    if (image.path.isNotEmpty) {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final Reference ref = storage
          .ref()
          .child('groupChatImages/${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = ref.putFile(image);
      final TaskSnapshot downloadUrl = (await uploadTask);
      imageURL = (await downloadUrl.ref.getDownloadURL());
      update();
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future addGroupChat() async {
    BotToast.showLoading();
    await addGroupChatImage();
    if (groupNameController.isNotEmpty && imageURL.isNotEmpty) {
      GroupChatService.createGroupChat(GroupChatModel(
        id: "",
        name: groupNameController,
        image: imageURL,
        members: selectedUsers.map((e) => e?.uid ?? "").toList(),
        admins: [UserService.myUser?.uid ?? ""],
        creatorId: UserService.myUser?.uid ?? "",
      ));
    } else {
      Get.snackbar('Error', 'Please fill all fields');
    }
    BotToast.closeAllLoading();
  }
}
