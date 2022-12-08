import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/notification_model.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/stories_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/remote_firebase_services/notification_services.dart';

import '../controllers/add_story_controller.dart';

class AddStoryView extends GetView<AddStoryController> {
  const AddStoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'Add story',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(() {
                if (controller.imageUrl.value == "") {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CupertinoActivityIndicator(),
                        Text('Loading ...'),
                      ],
                    ),
                  );
                } else {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          controller.imageUrl.value,
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.darken,
                          color: ColorsManger.black.withOpacity(.5),
                        ),
                      ),
                      Center(
                        child: Image.network(
                          controller.imageUrl.value,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                          bottom: -1,
                          child: Container(
                            width: Get.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: TextFormField(
                                          controller:
                                              controller.postEditingController,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              hintText: 'Write something...'),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await StoriesServices.addStory(

                                                  StoryModel(
                                                    storyImageUrl: controller
                                                        .imageUrl.value,
                                                    storyText: controller
                                                        .postEditingController
                                                        .text,
                                                    user: UserService.myUser,
                                                  ),
                                                  UserService.myUser?.uid ?? "")
                                              .then((value) => NotificationService
                                                  .sendNotification(NotificationModel(
                                                      title:
                                                          "New story by${UserService.myUser?.firstName ?? ""} ${UserService.myUser?.lastName ?? ""}",
                                                      body: controller
                                                                  .postEditingController
                                                                  .text
                                                                  .length >
                                                              20
                                                          ? "${controller.postEditingController.text.substring(0, 20)}..."
                                                          : controller
                                                              .postEditingController
                                                              .text,
                                                      type: "story",
                                                      fromUser:
                                                          UserService.myUser,
                                                      toUsers: UserService
                                                          .myUser?.followers,
                                                      imageUrl: controller
                                                          .imageUrl.value)));
                                          Get.back();

                                          Get.forceAppUpdate();
                                        },
                                        icon: const Icon(
                                          Iconsax.send1,
                                          color: ColorsManger.primary,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ],
                  );
                }
              }),
            ),
          ],
        ));
  }
}
