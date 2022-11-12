import 'package:flutter/material.dart';
import 'package:flutter_feed_reaction/flutter_feed_reaction.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../../assets.dart';
import '../../../../../core/resourses/color_manger.dart';

class ReactionButton extends StatelessWidget {
  ReactionButton({Key? key}) : super(key: key);

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
            children: const [
              CircleAvatar(
                  backgroundColor: ColorsManger.grey1,
                  child: Icon(Iconsax.like)),
              SizedBox(
                width: 5,
              ),
              Text('1.2k')
            ],
          ),
          onReactionSelected: (val) {
            print(val.name);
          },
          onPressed: () {
            print("Pressed");
          },
          dragSpace: 50.0,
        ),
      ],
    );
  }
}
