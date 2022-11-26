import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/resourses/color_manger.dart';
import '../controllers/video_chat_controller.dart';

class VideoChatView extends GetView<VideoChatController> {
  const VideoChatView({super.key});

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
          body: SafeArea(
              child: GetBuilder<VideoChatController>(
            builder: (controller) => Stack(
              children: [
                // Container for the local video
                Center(
                  child: _remoteVideo(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Center(
                      child: controller.localUserJoined
                          ? _localPreview()
                          : const CircularProgressIndicator(),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  child: SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: controller.toggleLotcalAudioMuted,
                          heroTag: 'micOff',
                          child: controller.localAudioMute == false
                              ? const Icon(Icons.mic)
                              : const Icon(Icons.mic_off),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FloatingActionButton(
                          onPressed: controller.switchCamera,
                          heroTag: 'cameraSwitch',
                          child: const Icon(Icons.switch_camera),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            controller.leave();
                          },
                          backgroundColor: Colors.red,
                          heroTag: 'endMeeting',
                          child: const Icon(Icons.call_end),
                        ),
                      ],
                    ),
                  ),
                ),
                // Button Row ends
              ],
            ),
          ))),
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
