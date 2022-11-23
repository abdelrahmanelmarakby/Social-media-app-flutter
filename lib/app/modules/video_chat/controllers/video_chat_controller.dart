import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/core/global/const.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoChatController extends GetxController {
  @override
  void onInit() {
    setupVideoSDKEngine();
    super.onInit();
  }

  @override
  void onClose() async {
    await agoraEngine.leaveChannel();
    super.onClose();
  }

  int? remoteUid; // uid of the remote user
  bool isJoined = false; // Indicates if the local user has joined the channel
  late RtcEngine agoraEngine; // Agora engine instance

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>(); // Global key to access the scaffold
  Future<void> setupVideoSDKEngine() async {
    // retrieve or request camera and microphone permissions
    await [Permission.microphone, Permission.camera].request();

    //create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: agoraID));

    await agoraEngine.enableVideo();

    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          showMessage(
              "Local user uid:${connection.localUid} joined the channel");

          isJoined = true;
          update();
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          showMessage("Remote user uid:$remoteUid joined the channel");

          remoteUid = remoteUid;
          update();
        },
        onUserOffline: (RtcConnection connection, int? remoteUid,
            UserOfflineReasonType reason) {
          showMessage("Remote user uid:$remoteUid left the channel");

          remoteUid = null;
          update();
        },
      ),
    );
  }

  void leave() {
    isJoined = false;
    remoteUid = null;
    update();
    agoraEngine.leaveChannel();
  }

  void join() async {
    await agoraEngine.startPreview();

    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
      token: agoraToken,
      channelId: "id:201094959669+id:201019706842+",
      options: options,
      uid: 0,
    );
  }

  showMessage(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
