import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/notification_model.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/notification_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/resourses/color_manger.dart';
import 'package:like_button/like_button.dart';

import '../../../../../core/resourses/font_manger.dart';

class ReactionButton extends StatelessWidget {
  const ReactionButton(
      {Key? key,
      this.reactionCount = 0,
      this.reactions = const [],
      required this.post})
      : super(key: key);
  final PostModel post;
  final List<Reaction> reactions;
  final int reactionCount;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 40,
      bubblesColor: const BubblesColor(
        dotPrimaryColor: ColorsManger.primary,
        dotSecondaryColor: ColorsManger.lightBlue,
        dotThirdColor: ColorsManger.pink,
      ),
      likeBuilder: (bool isLiked) {
        isLiked = post.reactions?.any(
                (element) => element.user?.uid == UserService.myUser?.uid) ??
            false;
        return isLiked
            ? const Icon(
                Iconsax.like_15,
                color: ColorsManger.primary,
                size: 20,
              )
            : const Icon(
                Iconsax.like_1,
                color: ColorsManger.primary,
                size: 20,
              );
      },
      likeCount: reactionCount,
      likeCountAnimationType: LikeCountAnimationType.all,
      countBuilder: (likeCount, isLiked, text) {
        final color = isLiked ? ColorsManger.primary : Colors.grey;
        Widget result;
        if (likeCount == 0) {
          result = Text(
            "like",
            style: getLightTextStyle(color: color, fontSize: FontSize.medium),
          );
        } else {
          result = Text(
            text,
            style: getLightTextStyle(color: color, fontSize: FontSize.medium),
          );
        }
        return result;
      },
      onTap: (isLiked) async {
        return !isLiked
            ? await PostService.addReactionToPost(
                post.id ?? "",
                Reaction(
                  user: UserService.myUser,
                  createdAt: DateTime.now(),
                  postId: post.id,
                  uid: UserService.myUser?.uid ?? "",
                  reaction: PostReactions.like.name,
                )).then((value) {
                NotificationService.sendNotification(
                  NotificationModel(
                      body:
                          "${UserService.myUser?.firstName} ${UserService.myUser?.lastName} Liked your post",
                      createdAt: DateTime.now(),
                      fromUser: UserService.myUser,
                      title: " New Like on your post",
                      toUsers: [post.user?.uid ?? ""],
                      type: "like"),
                );
                return true;
              })
            : await PostService.removeReactionFromPost(
                    post.id ?? "", UserService.myUser?.uid ?? "")
                .then((value) => false);
      },
    );
  }
}
