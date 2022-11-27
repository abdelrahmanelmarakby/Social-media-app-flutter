import 'package:get/get.dart';

class VideoChatController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     setupVideoSDKEngine();
//   }

//   var arguments = Get.arguments;

//   @override
//   void onClose() async {
//     await agoraEngine.leaveChannel();
//     super.onClose();
//   }

//   int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
//   bool videoCallEstablished = false;
//   int? remoteUid; // uid of the remote user
//   bool isJoined = false; // Indicates if the local user has joined the channel
//   late RtcEngine agoraEngine; // Agora engine instance
//   bool localAudioMute = false;
//   bool localUserJoined = false;

//   final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
//       GlobalKey<ScaffoldMessengerState>(); // Global key to access the scaffold
//   Future<void> setupVideoSDKEngine() async {
//     // retrieve or request camera and microphone permissions
//     await [Permission.microphone, Permission.camera].request();

//     //create an instance of the Agora engine
//     agoraEngine = createAgoraRtcEngine();
//     await agoraEngine.initialize(const RtcEngineContext(appId: agoraID));

//     await agoraEngine.enableVideo();

//     // Register the event handler
//     agoraEngine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           showMessage(
//               "Local user uid:${connection.localUid} joined the channel");

//           isJoined = true;
//           update();
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           showMessage("Remote user uid:$remoteUid joined the channel");

//           remoteUid = remoteUid;
//           update();
//         },
//         onUserOffline: (RtcConnection connection, int? remoteUid,
//             UserOfflineReasonType reason) {
//           showMessage("Remote user uid:$remoteUid left the channel");

//           remoteUid = null;
//           leave();
//           update();
//         },
//       ),
//     );
//   }

//   void leave() {
//     isJoined = false;
//     remoteUid = null;
//     update();
//     agoraEngine.leaveChannel();
//     Get.back();
//   }

//   void join() async {
//     await agoraEngine.startPreview();

//     // Set channel options including the client role and channel profile
//     ChannelMediaOptions options = const ChannelMediaOptions(
//       clientRoleType: ClientRoleType.clientRoleBroadcaster,
//       channelProfile: ChannelProfileType.channelProfileCommunication,
//     );

//     await agoraEngine.joinChannel(
//       token: "",
//       channelId: "id:201094959669+id:201019706842+",
//       options: options,
//       uid: 0,
//     );
//     update();
//   }

//   Future switchCamera() async {
//     try {
//       await agoraEngine.switchCamera();
//     } catch (e) {
//       showMessage(e.toString());
//     }
//   }

//   Future toggleLotcalAudioMuted() async {
//     try {
//       localAudioMute = !localAudioMute;
//       await agoraEngine.muteLocalAudioStream(localAudioMute);
//       update();
//     } catch (e) {
//       showMessage(e.toString());
//     }
//   }

//   showMessage(String message) {
//     scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
//       content: Text(message),
//     ));
//   }
}
