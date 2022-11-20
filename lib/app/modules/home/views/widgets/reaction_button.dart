import 'package:flutter/material.dart';
import 'package:flutter_feed_reaction/flutter_feed_reaction.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../../assets.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../data/remote_firebase_services/user_services.dart';

class ReactionButton extends StatelessWidget {
  ReactionButton(
      {Key? key,
      this.reactionCount = 0,
      this.reactions = const [],
      required this.post})
      : super(key: key);
  final PostModel post;
  final int reactionCount;
  final List<Reaction> reactions;
  final _reactions = [
    FeedReaction(
      name: "Like",
      reaction: Lottie.asset(
        Assets.lottie.likeJSON,
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "Love",
      reaction: Lottie.asset(
        Assets.lottie.loveJSON,
        width: 20.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "haha",
      reaction: Lottie.asset(
        Assets.lottie.hahaJSON,
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "Care",
      reaction: Lottie.asset(
        Assets.lottie.careJSON,
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "Angry",
      reaction: Lottie.asset(
        Assets.lottie.angryJSON,
        width: 40.0,
        height: 40.0,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return _differentWidgetReaction();
  }

  // When different widget is used as reactions
  Widget _differentWidgetReaction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlutterFeedReaction(
          reactions: _reactions,
          prefix: Row(
            children: [
              const CircleAvatar(
                  backgroundColor: ColorsManger.light,
                  child: Icon(Iconsax.like_1)),
              const SizedBox(
                width: 5,
              ),
              Text(reactionCount.toString()),
            ],
          ),
          onReactionSelected: (val) {
            // ignore: avoid_print
            PostService.addReactionToPost(
                post.id ?? "",
                Reaction(
                  createdAt: DateTime.now(),
                  reaction: val.name,
                  user: UserService.myUser,
                  postId: post.id,
                  uid: UserService.myUser?.uid,
                ));
          },
          onPressed: () {
            // ignore: avoid_print
            print("Pressed");
          },
          dragSpace: 50.0,
        ),
      ],
    );
  }
}
