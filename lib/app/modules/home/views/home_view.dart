import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_list/flutter_story_list.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/global/var.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:future_chat/core/services/firebase/upload_files.dart';

import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: Column(
          children: const [],
        ));
  }
}

class Stories extends GetWidget<HomeController> {
  const Stories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoryList(
      itemMargin: 20,
      itemBuilder: (context, index) {
        return SizedBox(
            height: 100,
            width: 100,
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                child: Image.network('http://picsum.photos/${index * 100}*5'),
                onTap: () {
                  Get.to(
                    StoryView(
                      storyItems: [
                        StoryItem(
                            Image.network(
                              'http://picsum.photos/${index * 100}*5',
                              fit: BoxFit.cover,
                            ),
                            duration: const Duration(seconds: 5)),
                      ],
                      controller: controller.storyController,
                    ),
                  );
                },
              ),
            ));
      },
      itemCount: 10,
      image: Image.network(
        UserService.myUser?.photoUrl ?? '',
        fit: BoxFit.cover,
      ),
      onPressedIcon: () => {
        UploadServices()
            .pickImage(type: "Story")
            .then((value) => UserService().addStoryToUser(
                uid: authUserID,
                story: Story(
                  createdAt: DateTime.now(),
                  storyImageUrl: value?[0],
                  userName:
                      '${UserService.myUser?.firstName} ${UserService.myUser?.lastName}',
                  userPhotoUrl: UserService.myUser?.photoUrl ?? '',
                  userId: authUserID,
                )))
      },
      text: Text(
        UserService.myUser?.firstName ?? '',
        style: getLightTextStyle(color: ColorsManger.primary),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        const Icon(
          CupertinoIcons.search,
          color: ColorsManger.primary,
          size: 30,
        ).paddingSymmetric(horizontal: 12),
      ],
      title: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text('Future ',
              style: getMediumTextStyle(
                  fontSize: 20, color: ColorsManger.primary)),
          Text('Chat',
              style:
                  getMediumTextStyle(fontSize: 20, color: ColorsManger.black)),
        ],
      ),
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
