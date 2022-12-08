import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post_model.dart';

class StoriesServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  static Future addStory(StoryModel story, String uid) async {
    DocumentReference documentReference =
        _firestore.collection("Stories").doc();
    return await FirebaseFirestore.instance.runTransaction((transaction) async {

      transaction.set(
        documentReference,
        story
            .copyWith(
              uid: uid,
              id: documentReference.id,
            )
            .toMap(),
      );
    });
  }

  addStorytoUser({required String uid, required StoryModel story}) async {
    DocumentReference documentReference =
        _firestore.collection("Stories").doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        story.copyWith(id: documentReference.id).toMap(),
      );
    });
    // ignore: avoid_print
    print("A story => ${story.toString()} added to user : $uid");
  }

  Stream<QuerySnapshot> getUserStory(String uid) {
    return _firestore
        .collection("Stories")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Future<QuerySnapshot> getAllUserStories(List<String> uids) {
    return _firestore
        .collection("Stories")
        .orderBy("createdAt", descending: true)
        .where("uid", whereIn: uids)
        .get();
  }
}
