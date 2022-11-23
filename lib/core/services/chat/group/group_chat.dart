import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:future_chat/app/data/models/group_chat_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';

import '../../../../app/data/models/group_chat_message.dart';

class GroupChatService {
  static Future createGroupChat(
    GroupChatModel groupChatModel,
  ) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("GroupChats").doc();
    await FirebaseFirestore.instance
        .runTransaction((transaction) async {
          transaction.set(
            documentReference,
            groupChatModel
                .copyWith(
                    creatorId: UserService.myUser?.uid ?? "",
                    id: documentReference.id,
                    createdAt: DateTime.now())
                .toMap(),
          );
        })
        .then((value) => BotToast.showText(text: "Group chat created"))
        .catchError((e) => BotToast.showText(text: e.toString()));
    print("Post $groupChatModel Added");
    return true;
  }

  static Future sendChatMessage({
    required GroupChatMessage groupChatMessage,
    required String groupChatId,
  }) async {
    try {
      final DocumentReference docRef = FirebaseFirestore.instance
          .collection("GroupChats")
          .doc(groupChatMessage.groupChatId)
          .collection('messages')
          .doc();
      groupChatMessage = groupChatMessage.copyWith(id: docRef.id);
      await docRef.set(groupChatMessage.toJson());
    } catch (e) {
      print(e);
    }
  }

  static Stream<List<GroupChatMessage>> getGroupChatMessages(
      String groupChatId) {
    return FirebaseFirestore.instance
        .collection("GroupChats")
        .doc(groupChatId)
        .collection('messages')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => GroupChatMessage.fromMap(e.data())).toList());
  }

  static Stream<List<GroupChatMessage>> getGroupChatMessagesByDate(
    String groupChatId,
  ) {
    return FirebaseFirestore.instance
        .collection("GroupChats")
        .doc(groupChatId)
        .collection('messages')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => GroupChatMessage.fromMap(e.data())).toList());
  }
}
