import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/resourses/color_manger.dart';
import 'package:like_button/like_button.dart';

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
      bubblesColor: const BubblesColor(
        dotPrimaryColor: ColorsManger.primary,
        dotSecondaryColor: ColorsManger.lightBlue,
        dotThirdColor: ColorsManger.pink,
      ),
      likeBuilder: (bool isLiked) {
        return isLiked
            ? const Icon(
                Iconsax.like_11,
                color: ColorsManger.primary,
                size: 20,
              )
            : const Icon(
                Iconsax.like_1,
                color: ColorsManger.primary,
                size: 20,
              );
      },
    );
  }
}
