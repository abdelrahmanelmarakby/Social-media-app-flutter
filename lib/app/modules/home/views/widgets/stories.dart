import 'package:flutter/material.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../controllers/home_controller.dart';

import 'package:flutter_story_list/flutter_story_list.dart';

class Stories extends StatelessWidget {
  Stories({
    Key? key,
  }) : super(key: key);
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: StoryList(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => StoryView(
                      storyItems: [
                        StoryItem.pageImage(
                          url: "https://picsum.photos/${(index * 100) + 1000}",
                          imageFit: BoxFit.cover,
                          controller: controller.storyController,
                        ),
                      ],
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
        ));
  }
}
