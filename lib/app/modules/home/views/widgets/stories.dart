import 'package:advstory/advstory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/models/user_model.dart';

import 'package:future_chat/app/data/remote_firebase_services/stories_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/routes/app_pages.dart';

import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:get/get.dart';

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
                  List<StoryModel> stories = [];
                  snapshot.data?.docs.map((e) {
                    stories.add(
                        StoryModel.fromMap(e.data() as Map<String, dynamic>));
                  }).toList();
                  stories = stories
                      .where((element) => (DateTime.now()
                              .difference(element.createdAt ?? DateTime.now())
                              .inDays <
                          1))
                      .toList();
                  List<List<StoryModel>> storiesForEachUser = stories
                      .fold<List<List<StoryModel>>>([],
                          (previousValue, element) {
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
                          child: SizedBox(
                            height: 60,
                            child: AdvStory(
                                preloadStory: true,
                                preloadContent: true,
                                style: const AdvStoryStyle(
                                    trayListStyle: TrayListStyle(
                                        padding: EdgeInsets.all(5))),
                                buildStoryOnTrayScroll: true,
                                storyCount: storiesForEachUser.length,
                                storyBuilder: (storyIndex) => openedStoyBuilder(
                                    storiesForEachUser, storyIndex),
                                trayBuilder: (storyIndex) => AdvStoryTray(
                                      url: storiesForEachUser[storyIndex][0]
                                              .storyImageUrl ??
                                          '',
                                      size: const Size(50, 50),
                                      borderGradientColors: [
                                        ColorsManger.primary,
                                        ColorsManger.primary.withOpacity(.9),
                                        ColorsManger.primary.withOpacity(.8),
                                        ColorsManger.primary.withOpacity(.7),
                                        ColorsManger.primary.withOpacity(.6),
                                        ColorsManger.primary.withOpacity(.5),
                                        ColorsManger.primary.withOpacity(.4),
                                      ],
                                      username: Text(
                                        storiesForEachUser[storyIndex][0]
                                                .user
                                                ?.firstName ??
                                            "",
                                        style: getLightTextStyle(
                                            color: ColorsManger.black,
                                            fontSize: FontSize.small),
                                      ),
                                    )),
                          ),
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

  Story openedStoyBuilder(
      List<List<StoryModel>> storiesForEachUser, int storyIndex) {
    return Story(
        contentCount: storiesForEachUser[storyIndex].length,
        contentBuilder: (contentIndex) {
          return ImageContent(
            url: storiesForEachUser[storyIndex][contentIndex].storyImageUrl ??
                '',
            header: StoryHeader(
              user: storiesForEachUser[storyIndex][contentIndex].user!,
            ),
            footer: StoryFooter(
              text:
                  storiesForEachUser[storyIndex][contentIndex].storyText ?? '',
            ),
            errorBuilder: () {
              return Container(
                color: ColorsManger.error,
                child: const Center(
                  child: Text("Error loading image"),
                ),
              );
            },
          );
        });
  }
}

class StoryHeader extends StatelessWidget {
  const StoryHeader({
    Key? key,
    required this.user,
  }) : super(key: key);
  final SocialMediaUser user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      alignment: Alignment.center,
      child: ListTile(
        onTap: () {
          Get.toNamed(Routes.OTHER_PROFILE, arguments: {
            "userId": user.uid ?? '',
          });
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            user.photoUrl ?? '',
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          "${user.firstName ?? ""} ${user.lastName ?? ""}",
          style: getMediumTextStyle(
              color: ColorsManger.white, fontSize: FontSize.large),
        ),
      ),
    );
  }
}

class StoryFooter extends StatelessWidget {
  const StoryFooter({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorsManger.primary.withOpacity(.2),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: getLightTextStyle(
                  color: ColorsManger.white, fontSize: FontSize.medium),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Add a comment...",
              filled: true,
              fillColor: Colors.transparent,
              hintStyle: getLightTextStyle(
                  color: ColorsManger.white, fontSize: FontSize.medium),
              border: InputBorder.none,
              suffixIcon: const Icon(
                Icons.send,
                color: ColorsManger.white,
              ),
            ),
            onFieldSubmitted: (value) {
              //TODO: Post MSG to story comments
            },
          ).paddingAll(8),
        ],
      ),
    );
  }
}
