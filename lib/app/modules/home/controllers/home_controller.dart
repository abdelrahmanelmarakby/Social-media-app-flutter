import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/stories_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class HomeController extends GetxController {
  StoryController storyController = StoryController();
  @override
  void onReady() {
    StoriesServices.addStory(
        Story(
          user: UserService.myUser,
          storyImageUrl: "https://picsum.photos/1200",
          storyText: "Abdelrahman ELmarakby",
          createdAt: DateTime.now(),
        ),
        UserService.myUser?.uid ?? '');
    super.onReady();
  }
}
