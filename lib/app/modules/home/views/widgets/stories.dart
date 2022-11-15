import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/stories_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../controllers/home_controller.dart';

import 'package:flutter_story_list/flutter_story_list.dart';

// ignore: must_be_immutable
class Stories extends StatelessWidget {
  Stories({
    Key? key,
  }) : super(key: key);
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: StreamBuilder(
          stream:
              StoriesServices().getUserStories(UserService.myUser?.uid ?? ''),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Story> stories = [];
              snapshot.data?.docs.map((e) {
                stories.add(Story.fromMap(e.data() as Map<String, dynamic>));
              }).toList();
              Get.log(stories.toString());
              return StoryList(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => StoryView(
                            storyItems: stories.map((e) {
                              if (e.storyText != null &&
                                  (e.storyImageUrl == null ||
                                      e.storyImageUrl == "")) {
                                return StoryItem.text(
                                    title: e.storyText!,
                                    textStyle: getBoldTextStyle(
                                        color: Colors.white, fontSize: 20),
                                    backgroundColor: ColorsManger.primary);
                              } else if ((e.storyText == null &&
                                      e.storyText != "") ||
                                  e.storyImageUrl != null) {
                                return StoryItem.inlineImage(
                                  url: e.storyImageUrl ?? "",
                                  controller: controller.storyController,
                                  caption: Text(
                                    e.storyText ?? "",
                                    textAlign: TextAlign.center,
                                    style: getBoldTextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                );
                              } else {
                                return StoryItem.pageImage(
                                  url: e.storyImageUrl ?? "",
                                  controller: controller.storyController,
                                  caption: e.storyText ?? "",
                                );
                              }
                            }).toList(),
                            controller: controller.storyController,
                            onComplete: () {
                              Get.back();
                            },
                          ));
                    },
                    child: SizedBox(
                      width: 120,
                      child: Image.network(
                        "https://picsum.photos/${(index * 100) + 500}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 10,
                image: Image.network(
                  UserService.myUser?.photoUrl ?? '',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                text: Text(
                  "${UserService.myUser?.firstName} ",
                  style: getLightTextStyle(
                    color: ColorsManger.primary,
                  ),
                ),
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ));
  }
}
