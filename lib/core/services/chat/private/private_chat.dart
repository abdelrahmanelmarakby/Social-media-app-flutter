import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../app/data/models/chat_model.dart';
import '../../../../app/data/models/private_chat_message.dart';

import 'package:future_chat/core/services/encryption_service.dart';

class PrivateChatService {
  final String myId;
  final String? hisId;
  PrivateChatService({required this.myId, this.hisId});
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('Chats');

  // stream for msg tab
  Stream<List<ChatRoom>> get getLastChatUser {
    return chatCollection
        .where('keywords', arrayContains: 'id+$myId+')
        .orderBy('lastChat', descending: true)
        .snapshots()
        .map(ChatRoom().fromQuery);
  }

  String getRoomId() {
    String roomId;
    int.parse(myId) > int.parse(hisId == null ? '0' : hisId!)
        ? roomId = 'id:$myId+id:$hisId+'
        : roomId = 'id:$hisId+id:$myId+';
    return roomId;
  }

  // stream for live chat
  Stream<List<PrivateMessage>> get getLivePrivateMessage {
    return chatCollection
        .doc(getRoomId())
        .collection('chat')
        .orderBy('time', descending: true)
        .snapshots()
        .map(PrivateMessage().fromQuery);
  }

  //post PrivateMessage <Message>
  Future<void> postPrivateMessage(
      {PrivateMessage? privateMessage,
      String? userA,
      String? userB,
      String? aName,
      String? bName,
      String? aImage,
      String? bImage}) async {
    try {
      final snapShot = await chatCollection.doc(getRoomId()).get();
      final newPrivateMessage =
          chatCollection.doc(getRoomId()).collection('chat').doc();
      if (!snapShot.exists) {
        List keyword = ['id+$userA+', 'id+$userB+'];
        final newChatRoom = chatCollection.doc(getRoomId());
        await newChatRoom
            .set(ChatRoom(
                    id: getRoomId(),
                    userA: userA,
                    aImage: aImage,
                    aName: aName,
                    userB: userB,
                    bImage: bImage,
                    bName: bName,
                    keywords: keyword,
                    lastMsg: privateMessage!.text?.encrypt,
                    lastSender: privateMessage.sender,
                    lastChat: privateMessage.time)
                .toJson())
            .then((doc) async {
          await newPrivateMessage
              .set(privateMessage.toJson())
              .then((doc) async {
            //update the chat room
            await chatCollection.doc(getRoomId()).update({
              'lastChat': privateMessage.time,
              'lastMsg': privateMessage.text,
              'lastSender': privateMessage.sender,
              'aName': aName,
              'bName': bName,
              'aImage': aImage,
              'bImage': bImage
            });
          }).catchError((error) {});

          return true;
        }).catchError((error) {});
      } else {
        await newPrivateMessage.set(privateMessage!.toJson()).then((doc) async {
          //update the chat room
          await chatCollection.doc(getRoomId()).update({
            'lastChat': privateMessage.time,
            'lastMsg': privateMessage.text,
            'lastSender': privateMessage.sender,
            'aName': aName,
            'bName': bName,
            'aImage': aImage,
            'bImage': bImage
          });
        }).catchError((error) {});
      }
    } catch (error) {}
  }
}
