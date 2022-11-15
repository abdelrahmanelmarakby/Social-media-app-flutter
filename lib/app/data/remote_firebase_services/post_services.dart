import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
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

  RxList getPostsbyUserIds(List<String> uids) {
    uids.add(UserService.myUser?.uid ?? "");
    RxList<PostModel> posts = RxList<PostModel>();
    for (String uid in uids) {
      _firestore.collection('Users').doc(uid).snapshots().listen((event) {
        if (event["post"].exists) {
          List<PostModel> postsList = event["post"]
              .map<PostModel>((e) => PostModel.fromMap(e))
              .toList();
          posts.addAll(postsList);
        }
      });
    }
    return posts;
  }
}
