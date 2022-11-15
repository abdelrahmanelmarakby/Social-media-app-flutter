import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class StoriesServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static addStory(Story story, String uid) {
    DocumentReference documentReference =
        _firestore.collection("Users").doc(uid).collection("Story").doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        story.copyWith(id: documentReference.id).toMap(),
      );
    });
    Get.log("A post => ${story.toString()} added to user : ${story.user?.uid}");
  }

  addStorytoUser({required String uid, required Story story}) async {
    DocumentReference documentReference =
        _firestore.collection("Users").doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "stories": FieldValue.arrayUnion([story.toMap()])
        },
      );
    });
    print("A story => ${story.toString()} added to user : $uid");
  }

  Stream<QuerySnapshot> getUserStories(String uid) {
    return _firestore
        .collection("Users")
        .doc(uid)
        .collection("Story")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }
}
