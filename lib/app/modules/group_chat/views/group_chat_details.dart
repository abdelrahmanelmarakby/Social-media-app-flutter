import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/group_chat/controllers/group_chat_controller.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';

class GroupChatDetails extends GetView<GroupChatController> {
  const GroupChatDetails({required this.users, super.key});
  final List<SocialMediaUser?> users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<GroupChatController>(
              builder: (controller) => GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
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
            GetBuilder<GroupChatController>(
              builder: (controller) => Text(
                controller.groupNameController == ""
                    ? "Group Name"
                    : controller.groupNameController,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter group name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onChanged: (value) {
                controller.groupNameController = value;
                controller.update();
              },
            ).paddingSymmetric(horizontal: 20),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await controller.addGroupChat();
                },
                child: const Text('Create Group'))
          ],
        ),
      ),
    );
  }
}
