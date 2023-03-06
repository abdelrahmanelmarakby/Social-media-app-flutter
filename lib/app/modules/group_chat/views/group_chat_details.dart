import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/group_chat_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/group_chat/controllers/group_chat_controller.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:future_chat/core/services/chat/group/group_chat.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import 'group_chats.dart';

class GroupChatDetails extends GetView<GroupChatController> {
  const GroupChatDetails({required this.users, super.key});
  final List<SocialMediaUser?> users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.light,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<GroupChatController>(
                      builder: (controller) => GestureDetector(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 2,
                              ),
                              shape: BoxShape.circle),
                          child: controller.image.path != ""
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    controller.image,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () async =>
                                      await controller.selectGroupImage(),
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                    color: ColorsManger.primary,
                                  )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: 'Type group name',
                            fillColor: Colors.transparent,
                            filled: true,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            )),
                        onChanged: (value) {
                          controller.groupNameController = value;
                          controller.update();
                        },
                      ).paddingSymmetric(horizontal: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Group participants',
                style: TextStyle(
                  color: ColorsManger.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).paddingSymmetric(horizontal: 20),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(users[index]?.photoUrl ?? ""),
                    ),
                  ),
                  title: Text(
                      "${users[index]?.firstName ?? " "} ${users[index]?.lastName ?? " "}"),
                );
              },
            )),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              color: ColorsManger.white,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 58),
                  backgroundColor: ColorsManger.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () async {
                  if (controller.groupNameController.isNotEmpty) {
                    await GroupChatService.createGroupChat(
                      GroupChatModel(
                          id: "",
                          name: controller.groupNameController,
                          image: controller.image.path,
                          admins: [UserService.myUser?.uid ?? ""],
                          creatorId: UserService.myUser?.uid ?? "",
                          members: users.map((e) => e?.uid ?? "").toList() +
                              [UserService.myUser?.uid ?? ""]),
                    ).then((value) {
                      Get.off(
                        () => const GroupChats(),
                      );
                      return BotToast.showText(text: "Group created");
                    });
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please enter group name',
                    );
                  }
                },
                child: Text(
                  'Create group',
                  style: getBoldTextStyle(color: ColorsManger.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
