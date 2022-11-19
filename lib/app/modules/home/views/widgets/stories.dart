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

// ignore: must_be_immutable
class Stories extends StatelessWidget {
  Stories({
    Key? key,
  }) : super(key: key);
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        padding: const EdgeInsets.only(left: 5, top: 5),
        margin: const EdgeInsets.only(left: 24, top: 20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            border: Border.all(
              color: const Color(0xFFCAF0F8),
              width: 1,
            )),
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: FutureBuilder(
              future: StoriesServices().getAllUserStories([
                UserService.myUser?.uid ?? '',
                ...UserService.myUser?.following ?? [],
              ]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Story> stories = [];
                  snapshot.data?.docs.map((e) {
                    stories
                        .add(Story.fromMap(e.data() as Map<String, dynamic>));
                  }).toList();
                  print("User Stories :$stories");
                  return SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: stories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => Scaffold(
                                    body: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: StoryView(
                                        storyItems: stories
                                            .where((element) =>
                                                element.uid ==
                                                stories[index].uid)
                                            .map((e) => StoryItem.pageImage(
                                                  url: e.storyImageUrl ?? "",
                                                  controller: controller
                                                      .storyController,
                                                  imageFit: BoxFit.cover,
                                                ))
                                            .toList(),

                                        /* stories.map((e) {
                                          if (e.storyText != null &&
                                              (e.storyImageUrl == null ||
                                                  e.storyImageUrl == "")) {
                                            return StoryItem.text(
                                                title: e.storyText!,
                                                textStyle: getBoldTextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                backgroundColor:
                                                    ColorsManger.primary);
                                          } else if ((e.storyText == null &&
                                                  e.storyText != "") ||
                                              e.storyImageUrl != null) {
                                            return StoryItem.inlineImage(
                                              url: e.storyImageUrl ?? "",
                                              controller:
                                                  controller.storyController,
                                              caption: Text(
                                                e.storyText ?? "",
                                                textAlign: TextAlign.center,
                                                style: getBoldTextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            );
                                          } else {
                                            return StoryItem.pageImage(
                                              url: e.storyImageUrl ?? "",
                                              controller:
                                                  controller.storyController,
                                              caption: e.storyText ?? "",
                                            );
                                          }
                                        }).toList(),*/
                                        controller: controller.storyController,
                                        onComplete: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ));
                            },
                            child: SizedBox(
                              width: context.width / 4,
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            stories[index].user?.photoUrl ??
                                                ""),
                                      ),
                                      Text(
                                        "${stories[index].user?.firstName} ",
                                        style: getMediumTextStyle(
                                            color: ColorsManger.grey,
                                            fontSize: 12),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        },
                      ));
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              },
            )));
  }
}
