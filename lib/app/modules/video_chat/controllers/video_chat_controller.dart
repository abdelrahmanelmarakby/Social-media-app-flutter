import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:future_chat/core/global/const.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoChatController extends GetxController {
  //TimeSlot orderedTimeslot = Get.arguments[0]['timeSlot'];
  //String token = Get.arguments['token'] ?? "";
  //String room = Get.arguments['room'];
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  bool videoCallEstablished = false;
  int? remoteUid;
  late RtcEngine engine;
  bool localAudioMute = false;
  bool localUserJoined = false;
  @override
  void onInit() {
    super.onInit();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    engine = await RtcEngine.create(agoraID);
    await engine.enableVideo();
    engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
          localUserJoined = true;
          update();
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          remoteUid = uid;
          update();
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          remoteUid = null;
          endMeeting();
          update();
        },
      ),
    );

    await engine.joinChannel(null, "room", null, 0);
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  @override
  void onClose() {}

  void hangUp() async {
    Get.back();
  }

  Future endMeeting() async {
    //  await VideoCallService().removeRoom(orderedTimeslot.timeSlotId!);
    await engine.leaveChannel();
    await engine.destroy();
    Get.back();
  }

  Future switchCamera() async {
    try {
      await engine.switchCamera();
    } catch (e) {
      //Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future toggleLotcalAudioMuted() async {
    try {
      localAudioMute = !localAudioMute;
      await engine.muteLocalAudioStream(localAudioMute);
      update();
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
    }
  }
}
