import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/post.dart';
import 'widgets/stories.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: RefreshIndicator(
          onRefresh: () => Get.forceAppUpdate(),
          color: ColorsManger.primary,
          child: Column(
            children: [
              Stories(),
              const PostList(),
            ],
          ),
        ));
  }
}
