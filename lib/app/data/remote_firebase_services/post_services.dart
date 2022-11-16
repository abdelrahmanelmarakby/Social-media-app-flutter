import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post_model.dart';

class PostService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static addPost(PostModel post, String uid) {
    DocumentReference documentReference = _firestore.collection("Posts").doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        post.copyWith(uid: uid, id: documentReference.id).toMap(),
      );
    });
  }

  static updatePost(String postId, PostModel post) {
    DocumentReference documentReference =
        _firestore.collection("Posts").doc(postId);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        post.copyWith(id: documentReference.id).toMap(),
      );
    });
  }

  static deletePostToUser({required String uid, required String postId}) async {
    _firestore.collection("Posts").doc(postId).delete();

    print("Deleted");
  }

  Future<QuerySnapshot<Object?>> getAllUserPosts(List<String> uids) {
    return _firestore
        .collection("Posts")
        .orderBy("createdAt", descending: true)
        .where("uid", whereIn: uids)
        .get();
  }
}
