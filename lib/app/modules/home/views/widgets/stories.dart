import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/stories_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';

import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/font_manger.dart';
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
        height: 120,
        margin: const EdgeInsets.only(
          left: 24,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorsManger.black.withOpacity(.05),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            border: Border.all(
              color: const Color(0xFFCAF0F8),
              width: .5,
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
                  stories = stories
                      .where((element) => (DateTime.now()
                              .difference(element.createdAt ?? DateTime.now())
                              .inDays <
                          1))
                      .toList();
                  List<List<Story>> storiesForEachUser = stories
                      .fold<List<List<Story>>>([], (previousValue, element) {
                    if (previousValue.isEmpty) {
                      previousValue.add([element]);
                    } else {
                      if (previousValue.last.last.uid == element.uid) {
                        previousValue.last.add(element);
                      } else {
                        previousValue.add([element]);
                      }
                    }
                    return previousValue;
                  });

                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Stories",
                          style: getLightTextStyle(
                            color: ColorsManger.black,
                            fontSize: FontSize.medium,
                          ),
                        ),
                      ).paddingAll(8),
                      Expanded(
                        child: AnimationLimiter(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: storiesForEachUser.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: ScaleAnimation(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => Scaffold(
                                            body: Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: StoryView(
                                                storyItems:
                                                    storiesForEachUser[index]
                                                        .map((e) {
                                                  if (e.storyText != null &&
                                                      (e.storyImageUrl ==
                                                              null ||
                                                          e.storyImageUrl ==
                                                              "")) {
                                                    return StoryItem.text(
                                                        title: e.storyText!,
                                                        textStyle:
                                                            getBoldTextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20),
                                                        backgroundColor:
                                                            ColorsManger
                                                                .primary);
                                                  } else if ((e.storyText ==
                                                              null &&
                                                          e.storyText != "") ||
                                                      e.storyImageUrl != null) {
                                                    return StoryItem
                                                        .inlineImage(
                                                      url:
                                                          e.storyImageUrl ?? "",
                                                      controller: controller
                                                          .storyController,
                                                      caption: Text(
                                                        e.storyText ?? "",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: getBoldTextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    );
                                                  } else {
                                                    return StoryItem.pageImage(
                                                      url:
                                                          e.storyImageUrl ?? "",
                                                      controller: controller
                                                          .storyController,
                                                      caption:
                                                          e.storyText ?? "",
                                                    );
                                                  }
                                                }).toList(),

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
                                                controller:
                                                    controller.storyController,
                                                onComplete: () {
                                                  Get.back();
                                                },
                                              ),
                                            ),
                                          ));
                                    },
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                storiesForEachUser[index][0]
                                                        .user
                                                        ?.photoUrl ??
                                                    ""),
                                          ),
                                          Text(
                                            storiesForEachUser[index][0]
                                                    .user
                                                    ?.firstName ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: getLightTextStyle(
                                                color: ColorsManger.grey,
                                                fontSize: FontSize.medium),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).paddingSymmetric(horizontal: 8),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              },
            ))).paddingOnly();
  }
}
