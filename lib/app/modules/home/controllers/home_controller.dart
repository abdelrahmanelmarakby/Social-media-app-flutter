import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class HomeController extends GetxController {
  //upload image
  //add story to user

  StoryController storyController = StoryController();
  @override
  void onReady() {
    PostService.addPost(
        PostModel(
          id: '1',
          createdAt: DateTime.now(),
          description: 'description',
          imageUrl: UserService.myUser?.photoUrl,
          user: UserService.myUser,
          reactions: [
            Reaction(
              reaction: PostReactions.like,
              user: UserService.myUser,
              createdAt: DateTime.now(),
              id: '1',
            ),
            Reaction(
              reaction: PostReactions.love,
              user: UserService.myUser,
              createdAt: DateTime.now(),
              id: '1',
            ),
            Reaction(
              reaction: PostReactions.angry,
              user: UserService.myUser,
              createdAt: DateTime.now(),
              id: '1',
            ),
          ],
          comments: [
            Comment(
              id: '1',
              createdAt: DateTime.now(),
              user: UserService.myUser,
              comment: 'comment',
              commentImageUrl: UserService.myUser?.photoUrl,
              postId: '1',
              reactions: [
                Reaction(
                  reaction: PostReactions.like,
                  user: UserService.myUser,
                  createdAt: DateTime.now(),
                  id: '1',
                ),
                Reaction(
                  reaction: PostReactions.love,
                  user: UserService.myUser,
                  createdAt: DateTime.now(),
                  id: '1',
                ),
                Reaction(
                  reaction: PostReactions.angry,
                  user: UserService.myUser,
                  createdAt: DateTime.now(),
                  id: '1',
                ),
              ],
            )
          ],
        ),
        UserService.myUser?.uid ?? "");
    super.onReady();
  }
}
