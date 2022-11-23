import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:future_chat/app/data/models/private_chat_message.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:get/get.dart';

class OtherProfileController extends GetxController {
  final String userId = Get.arguments['userId'] ?? "";

  final int MyId = int.parse(
      UserService.myUser?.phoneNumber?.replaceAll(RegExp(r'[^0-9]'), '') ?? "");
  String getRoomId(
    String hisId,
  ) {
    final int myId = int.parse(
        UserService.myUser?.phoneNumber?.replaceAll(RegExp(r'[^0-9]'), '') ??
            "");
    hisId = int.parse(hisId.replaceAll(RegExp(r'[^0-9]'), '')).toString();
    String roomId;
    myId > int.parse(hisId)
        ? roomId = 'id:$myId+id:$hisId+'
        : myId < int.parse(hisId)
            ? roomId = 'id:$hisId+id:$myId+'
            : roomId = 'id:$myId+id:$hisId+';
    return roomId;
  }

  // stream for live chat
  Future<List<String>> getChatImagesUrl(
    String hisId,
  ) async {
    final CollectionReference chatCollection =
        FirebaseFirestore.instance.collection('Chats');
    Get.log(getRoomId(hisId));
    List<PrivateMessage> messages = await chatCollection
        .doc(getRoomId(hisId))
        .collection('chat')
        .orderBy('time', descending: true)
        .where("image", isNotEqualTo: null)
        .get()
        .then((value) {
      print(value.docs);
      return PrivateMessage().fromQuery(value);
    });

    List<String> imagesUrl = [];
    for (var message in messages) {
      if (message.image != null) {
        imagesUrl.add(message.image!);
      }
    }
    return imagesUrl;
  }
}
