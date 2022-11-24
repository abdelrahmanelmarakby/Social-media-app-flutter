import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/video_chat_controller.dart';

class VideoChatView extends GetView<VideoChatController> {
  @override
  // Build UI
  @override
  Widget build(BuildContext context) {
    Get.put(VideoChatController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: controller.scaffoldMessengerKey,
      home: Scaffold(
          backgroundColor: ColorsManger.white,
          appBar: AppBar(
            title: Text(
              'Get started with Video Calling',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 18),
            ),
            backgroundColor: ColorsManger.white,
            elevation: 0,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            children: [
              // Container for the local video
              Container(
                height: 240,
                decoration: BoxDecoration(border: Border.all()),
                child: Center(child: _localPreview()),
              ),
              const SizedBox(height: 10),
              //Container for the Remote video
              Container(
                height: 240,
                decoration: BoxDecoration(border: Border.all()),
                child: Center(child: _remoteVideo()),
              ),
              // Button Row
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.isJoined
                          ? null
                          : () => {controller.join()},
                      child: const Text("Join"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.isJoined
                          ? () => {controller.leave()}
                          : null,
                      child: const Text("Leave"),
                    ),
                  ),
                ],
              ),
              // Button Row ends
            ],
          )),
    );
  }

  // Display local video preview
  Widget _localPreview() {
    if (controller.isJoined) {
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: controller.agoraEngine,
          canvas: const VideoCanvas(uid: null),
        ),
      );
    } else {
      return const Text(
        'Join a channel',
        textAlign: TextAlign.center,
      );
    }
  }

// Display remote user's video
  Widget _remoteVideo() {
    if (controller.remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: controller.agoraEngine,
          canvas: VideoCanvas(uid: controller.remoteUid),
          connection: const RtcConnection(
              channelId: "id:201094959669+id:201019706842+"),
        ),
      );
    } else {
      String msg = '';
      if (controller.isJoined) msg = 'Waiting for a remote user to join';
      return Text(
        msg,
        textAlign: TextAlign.center,
      );
    }
  }
}
