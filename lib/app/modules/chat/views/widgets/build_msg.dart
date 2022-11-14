import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:video_viewer/video_viewer.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/font_manger.dart';
import '../../../../data/models/private_chat_message.dart';

class MessageBuilder extends StatelessWidget {
  final PrivateMessage? msg;
  final bool isMe;

  const MessageBuilder({this.msg, this.isMe = true});

  @override
  Widget build(BuildContext context) {
    return isMe
        ? Bubble(
            margin: const BubbleEdges.only(top: 10),
            alignment: Alignment.topRight,
            padding: const BubbleEdges.only(left: 15, right: 15),
            nip: BubbleNip.rightTop,
            color: ColorsManger.primary,
            child: msgBuilder(
                context: context, msg: msg as PrivateMessage, isMe: true),
          )
        : Bubble(
            margin: const BubbleEdges.only(top: 10),
            alignment: Alignment.topLeft,
            padding: const BubbleEdges.only(left: 15, right: 15),
            nip: BubbleNip.leftTop,
            child: msgBuilder(
                context: context, msg: msg as PrivateMessage, isMe: false),
          );
  }

  Widget msgBuilder(
      {required PrivateMessage msg,
      bool? isMe,
      required BuildContext context}) {
    //notify user when he get a new message
    //if (!isMe) {}

    int hour = msg.time?.hour ?? 0;
    String amPm = '';
    if (msg.time?.hour == 0) {
      hour = 12;
      amPm = 'AM';
    } else if (msg.time?.hour == 12) {
      amPm = 'PM';
    } else if ((msg.time?.hour ?? 0) > 12) {
      hour = (msg.time?.hour ?? 0) - 12;
      amPm = 'PM';
    } else {
      amPm = 'AM';
    }
    if (msg.image == null && msg.text != null && msg.video == null) {
      print('${msg.text} ${msg.video} ${msg.image}');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (msg.image == null || msg.image == 'null') &&
                msg.text != null &&
                (msg.video == null || msg.video == 'null')
            ? Text(
                '${msg.text}',
                style: getMediumTextStyle(
                  color: Colors.white,
                  fontSize: FontSize.large,
                ),
              )
            : const SizedBox(),
        msg.image != null &&
                (msg.text == null || msg.text == '') &&
                (msg.video == null || msg.video == '')
            ? InstaImageViewer(
                child: Image.network(
                  msg.image ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              )
            : const SizedBox(),
        msg.video != null &&
                (msg.text == null || msg.text == '') &&
                (msg.image == null || msg.image == '')
            ? VideoViewer(
                source: {
                  "WebVTT Caption": VideoSource(
                      video: VideoPlayerController.network(
                    //This video has a problem when end
                    msg.video ?? '',
                  )),
                },
              )
            : const SizedBox(),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isMe == true
                ? const Icon(
                    Icons.check,
                    //    size: Dimensions.getDesirableWidth(4),
                    color: Colors.grey,
                  )
                : const SizedBox(),
            const SizedBox(
              width: 2,
            ),
            Text(
              '$hour:${msg.time?.minute} $amPm',
              style: const TextStyle(
                  //   fontSize: Dimensions.getDesirableWidth(3),
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
