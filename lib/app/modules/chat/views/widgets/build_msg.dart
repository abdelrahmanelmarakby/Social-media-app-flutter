import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart' hide Size;
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:future_chat/core/services/encryption_service.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_viewer/video_viewer.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../data/models/private_chat_message.dart';

class MessageBuilder extends StatefulWidget {
  final PrivateMessage? msg;
  final bool isMe;

  const MessageBuilder({super.key, this.msg, this.isMe = true});

  @override
  State<MessageBuilder> createState() => _MessageBuilderState();
}

class _MessageBuilderState extends State<MessageBuilder> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller =
        VideoPlayerController.network(widget.msg?.video?.decrypt ?? "",
            videoPlayerOptions: VideoPlayerOptions(
              mixWithOthers: false,
              allowBackgroundPlayback: false,
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMe) {
      return Bubble(
        margin: const BubbleEdges.only(top: 10),
        alignment: Alignment.topRight,
        padding: const BubbleEdges.only(left: 15, right: 15),
        nip: BubbleNip.rightTop,
        color: ColorsManger.primary.withOpacity(.8),
        child: msgBuilder(
            context: context, msg: widget.msg as PrivateMessage, isMe: true),
      );
    } else {
      return Bubble(
        margin: const BubbleEdges.only(top: 10),
        alignment: Alignment.topLeft,
        padding: const BubbleEdges.only(left: 15, right: 15),
        nip: BubbleNip.leftTop,
        child: msgBuilder(
          context: context,
          msg: widget.msg as PrivateMessage,
          isMe: false,
        ),
      );
    }
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
        if ((msg.image == null || msg.image == 'null') &&
            msg.text != null &&
            (msg.video == null || msg.video == 'null'))
          LinkPreviewText(
            url: '${msg.text?.decrypt}',
          )
        else
          const SizedBox(),
        if (msg.image != null &&
            (msg.text == null || msg.text == '') &&
            (msg.video == null || msg.video == ''))
          InstaImageViewer(
            disposeLevel: DisposeLevel.high,
            child: Image.network(
              msg.image?.decrypt ?? '',
              //fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 100,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          )
        else
          const SizedBox(),
        if (msg.video != null)
          VideoViewer(
            source: {
              "": VideoSource(video: _controller),
            },
          )
        else
          const SizedBox(),
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
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}

class LinkPreviewText extends StatefulWidget {
  LinkPreviewText({
    super.key,
    required this.url,
  });
  String url;
  Map<String, PreviewData> datas = {};
  @override
  State<LinkPreviewText> createState() => _LinkPreviewTextState();
}

class _LinkPreviewTextState extends State<LinkPreviewText> {
  @override
  Widget build(BuildContext context) {
    bool isLink = false;
    widget.url = widget.url;
    widget.url.split(' ').forEach((element) {
      element = element.toLowerCase();
      if (element.contains('http') ||
          element.contains('https') ||
          element.contains('www') ||
          element.contains('.com')) {
        isLink = true;
        widget.datas[element] = const PreviewData();
      }
    });
    if (isLink) {
      return LinkPreview(
        enableAnimation: true,
        onPreviewDataFetched: (data) {
          setState(() {
            widget.datas = {
              ...widget.datas,
              widget.url: data,
            };
          });
        },
        onLinkPressed: (url) {
          launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          );
        },
        previewData: widget.datas[widget.url],
        text: widget.url,
        textStyle: getRegularTextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        linkStyle: getRegularTextStyle(
          color: Colors.blue,
          fontSize: 12,
        ),
        openOnPreviewImageTap: true,
        openOnPreviewTitleTap: true,
        width: MediaQuery.of(context).size.width - 100,
      );
    } else {
      return RichText(
        text: TextSpan(
          text: widget.url,
          style: getRegularTextStyle(
            color: Colors.black,
            fontSize: 12,
          ),

          // style: Theme.of(context).textTheme.headline6,
        ),
      );
    }
  }
}
