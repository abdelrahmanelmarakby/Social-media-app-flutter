import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(left: 5,top: 5),
      margin: const EdgeInsets.only(left: 24,top: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft:Radius.circular(16),
        bottomLeft: Radius.circular(16)),
        border: Border.all(
          color: const Color(0xFFCAF0F8),
          width: 1,
        ) ),
      child: Directionality(
              textDirection: TextDirection.ltr,
              child: SizedBox(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                    Get.to(() => StoryView(
                          storyItems: [
                            StoryItem.inlineImage(
                              url: "https://picsum.photos/${(100) + 1000}",
                              imageFit: BoxFit.contain,
                              controller: controller.storyController,
                            ),
                          ],
                          inline: true,
                          progressPosition: ProgressPosition.top,
                          controller: controller.storyController,
                          repeat: false,
                          onComplete: () {
                            Get.back();
                          },
                        ));
                  },
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child:Padding(padding: const EdgeInsets.all(5),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              "https://picsum.photos/${(index * 120) + 500}",
                            ),
                          ),
                          Text('nada',
                          style: getMediumTextStyle(color: ColorsManger.grey,
                          fontSize: 12),)
                          ],)) ,
                        ),
                      );
                    }),
              )),
      );
  }
}
