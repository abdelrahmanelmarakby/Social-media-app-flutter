import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_chat_controller.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class VideoChatView extends GetView<VideoChatController> {
  const VideoChatView({super.key});

  @override
  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<VideoChatController>(
          init: VideoChatController(),
          builder: (_) {
            return Stack(
              children: [
                Center(
                  child: _remoteVideo(),
                ),
                Positioned(
                  bottom: 100,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 100,
                        height: 150,
                        child: Center(
                          child: controller.localUserJoined
                              ? const RtcLocalView.SurfaceView()
                              : const CircularProgressIndicator(),
                        ),
                      ),
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
                            controller.endMeeting();
                          },
                          backgroundColor: Colors.red,
                          heroTag: 'endMeeting',
                          child: const Icon(Icons.call_end),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _remoteVideo() {
    if (controller.remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: controller.remoteUid!,
        channelId: "room",
        renderMode: VideoRenderMode.FILL,
      );
    } else {
      return Text(
        'Please wait for remote user to join'.tr,
        textAlign: TextAlign.center,
      );
    }
  }
}
