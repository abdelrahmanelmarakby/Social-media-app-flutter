import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/chat/views/widgets/build_msg.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:video_viewer/video_viewer.dart';

import '../../../../data/models/private_chat_message.dart';

class MessageOptions extends StatefulWidget {
  const MessageOptions({super.key, required this.msg, required this.heroTAG});
  final PrivateMessage msg;
  final String heroTAG;

  @override
  State<MessageOptions> createState() => _MessageOptionsState();
}

class _MessageOptionsState extends State<MessageOptions> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.msg.video ?? "",
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: false,
          allowBackgroundPlayback: false,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: (widget.msg.time?.millisecondsSinceEpoch ?? 0).toString(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ((widget.msg.image == null || widget.msg.image == 'null') &&
                  widget.msg.text != null &&
                  (widget.msg.video == null || widget.msg.video == 'null'))
                LinkPreviewText(
                  url: '${widget.msg.text}',
                )
              else
                const SizedBox(),
              if (widget.msg.image != null &&
                  (widget.msg.text == null || widget.msg.text == '') &&
                  (widget.msg.video == null || widget.msg.video == ''))
                InstaImageViewer(
                  disposeLevel: DisposeLevel.high,
                  child: Image.network(
                    widget.msg.image ?? '',
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
              if (widget.msg.video != null)
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
                children: const [
                  Icon(
                    Icons.check,
                    //    size: Dimensions.getDesirableWidth(4),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
