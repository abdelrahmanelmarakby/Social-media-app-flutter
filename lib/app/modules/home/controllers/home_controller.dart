import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class HomeController extends GetxController {
  StoryController storyController = StoryController();
  TextEditingController sharedCommentEditingController =
      TextEditingController();
  List<PostModel> posts = [];

  ScrollController scrollController = ScrollController();

  TextEditingController storyReply = TextEditingController();
  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("end");
      }
    });
    super.onInit();
  }
}
