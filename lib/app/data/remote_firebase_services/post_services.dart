import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class PostService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static addPost(PostModel post, String uid) {
    DocumentReference documentReference =
        _firestore.collection("Users").doc(uid).collection("Posts").doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        post.copyWith(id: documentReference.id).toMap(),
      );
    });
    Get.log(
        "A post => ${post.title}  added to user : ${post.user?.firstName} ${post.user?.lastName}");
  }

  static updatePostToUser(
      {required String uid, required PostModel post}) async {
    DocumentReference documentReference =
        _firestore.collection("Users").doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "post": FieldValue.arrayUnion([post.toMap()])
        },
      );
    });
    print("Updated");
  }

  static deletePostToUser({required String uid, required String postId}) async {
    _firestore
        .collection("Users")
        .doc(uid)
        .collection("Posts")
        .doc(postId)
        .delete();

    print("Deleted");
  }

  Stream<QuerySnapshot<Object?>> getUserPost(uid) {
    return _firestore
        .collection("Users")
        .doc(uid)
        .collection("Posts")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Object?>> getAllUserPosts(List<String> uids) {
    Stream<QuerySnapshot<Object?>>? allPosts;
    for (var i = 0; i < uids.length; i++) {
      allPosts = _firestore
          .collection("Users")
          .doc(uids[i])
          .collection("Posts")
          .snapshots();
    }
    return allPosts!;
  }
}
