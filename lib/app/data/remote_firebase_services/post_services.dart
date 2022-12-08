import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:future_chat/core/services/dynamic_links.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class PostService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<bool> addPost(PostModel post, String uid) async {
    DocumentReference documentReference = _firestore.collection("Posts").doc();
    final postUrl = await Get.find<DynamicLinkService>()
        .createDynamicLink("post", documentReference.id)
        .catchError((e) {
      Get.snackbar("Error", "Error creating post link");
    });
    Get.snackbar("Post Link", postUrl.toString());
    await FirebaseFirestore.instance
        .runTransaction((transaction) async {
          transaction.set(
            documentReference,
            post
                .copyWith(
                    uid: uid,
                    id: documentReference.id,
                    postUrl: postUrl.toString(),
                    createdAt: DateTime.now())
                .toMap(),
          );
        })
        .onError((error, stackTrace) {
          BotToast.showText(text: "Error");
          BotToast.closeAllLoading();
        })
        .then((value) => BotToast.showText(text: "Post Added"))
        .catchError((error) {
          BotToast.closeAllLoading();
          return BotToast.showText(text: "Error : $error");
        });
    return true;
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

  static Future<bool> addReactionToPost(
      String postId, Reaction reaction) async {
    try {
      DocumentReference documentReference =
          _firestore.collection("Posts").doc(postId);
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.update(
          documentReference,
          {
            "reactions": FieldValue.arrayUnion([reaction.toMap()]),
          },
        );
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> addCommentToPost(String postId, Comment comment) async {
    DocumentReference documentReference =
        _firestore.collection("Posts").doc(postId);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "comments": FieldValue.arrayUnion([comment.toMap()])
        },
      );
    });
    return true;
  }

  Stream<List<Comment>> getComments(String postId) {
    return _firestore.collection("Posts").doc(postId).snapshots().map((event) =>
        event
            .data()!["comments"]
            ?.map<Comment>((e) => Comment.fromMap(e))
            .toList() ??
        []);
  }

  static Future deletePostToUser({required String postId}) async {
    await _firestore.collection("Posts").doc(postId).delete();

    // ignore: avoid_print
    print("Deleted");
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUserPosts(
      List<String> uids) async {
    // ignore: avoid_print
    print("uids $uids");

    final data = await _firestore
        .collection("Posts")
        .orderBy("createdAt", descending: true)
        .where("uid", whereIn: uids)
        .get();
    return data;
  }

  static Future removeReactionFromPost(String postId, String uid) async {
    DocumentReference documentReference =
        _firestore.collection("Posts").doc(postId);
    return await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "reactions": FieldValue.arrayRemove([
            {
              "uid": uid,
            }
          ])
        },
      );
    });
  }
}
