import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class UserService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static SocialMediaUser? myUser;

  Future<SocialMediaUser> getProfile(String uid) async {
    Get.log('getProfile() called');
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await firebaseFirestore.collection('Users').doc(uid).get();
    Get.log('id: $uid called');

    final Map<String, dynamic> map = doc.data()!;
    Get.log('map: $map called');
    SocialMediaUser user = SocialMediaUser.fromMap(map);
    Get.log("User ${user.firstName} ${user.lastName} is fetched");
    return user;
  }

  Future<SocialMediaUser> addUser({required SocialMediaUser user}) async {
    DocumentReference documentReference =
        firebaseFirestore.collection("Users").doc(user.uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        user.toMap(),
      );
    });
    return user;
    // print("sent");
  }

  void updateUser({required SocialMediaUser user}) async {
    DocumentReference documentReference =
        firebaseFirestore.collection("Users").doc(user.uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        user.toMap(),
      );
    });
    //  print("sent");
  }

  ///add Story to User Profile
  void addStoryToUser({required String uid, required Story story}) async {
    DocumentReference documentReference =
        firebaseFirestore.collection("Users").doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        {
          "stories": FieldValue.arrayUnion([story.toMap()])
        },
      );
    });
    //  print("sent");
  }

  //get users by IDS
  Future<List<SocialMediaUser>> getUsersByIds(List<String> ids) async {
    List<SocialMediaUser> users = [];

    await getProfile(ids[0])
        .then((value) => Get.log("User ${value.toString()}"));
    for (var id in ids) {
      Get.log("Getting user with id $id");
      users.add(await getProfile(id));
    }
    return users;
  }
}
