import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:future_chat/app/data/models/user_model.dart';

import '../models/post_model.dart';

class UserService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static SocialMediaUser? myUser;

  Future<SocialMediaUser?> getProfile(String uid) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await firebaseFirestore.collection('Users').doc(uid).get();
    if (doc.data() == null) {
      return null;
    }

    final Map<String, dynamic>? map = doc.data();
    SocialMediaUser user = SocialMediaUser.fromMap(map!);
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

  updateUser({required SocialMediaUser user}) async {
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
  void addStoryToUser({required String uid, required StoryModel story}) async {
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
  Future<List<SocialMediaUser?>> getUsersByIds(List<String> ids) async {
    List<SocialMediaUser?> users = [];

    for (var id in ids) {
      users.add(await getProfile(id));
    }
    return users;
  }

  Future deleteUser(String uid) async {
    await firebaseFirestore.collection("Users").doc(uid).delete();
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
