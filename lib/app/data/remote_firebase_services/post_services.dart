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
        post
            .copyWith(
                uid: uid, id: documentReference.id, createdAt: DateTime.now())
            .toMap(),
      );
    });
    print("Post $post Added");
  }

  static updatePost(String postId, PostModel post) {
    DocumentReference documentReference =
        _firestore.collection("Posts").doc(postId);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        post.toMap(),
      );
    });
    return null;
  }

  static addCommentToPost(String postId, Comment comment) {
    DocumentReference documentReference =
        _firestore.collection("Posts").doc(postId);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "comments": FieldValue.arrayUnion([comment.toMap()])
        },
      );
    });
    return null;
  }

  Stream<List<Comment>> getComments(String postId) {
    return _firestore.collection("Posts").doc(postId).snapshots().map(
          (event) => (event.data() as Map<String, dynamic>)["comments"]
              .map<Comment>((e) => Comment.fromMap(e))
              .toList(),
        );
  }

  static deletePostToUser({required String uid, required String postId}) async {
    _firestore.collection("Posts").doc(postId).delete();

    print("Deleted");
  }

  Future<QuerySnapshot<Object?>> getAllUserPosts(List<String> uids) async {
    print("uids $uids");
    final data = _firestore
        .collection("Posts")
        //.orderBy("createdAt", descending: true)
        .where("uid", whereIn: uids)
        .get();
    await data.then((value) {
      print("value ${value.docs.length}");
    });
    return data;
  }
}
