import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:future_chat/app/data/models/user_model.dart';

import '../models/post_model.dart';

class UserService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static SocialMediaUser? myUser;

  Future<SocialMediaUser> getProfile(String uid) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await firebaseFirestore.collection('Users').doc(uid).get();
    final Map<String, dynamic> data = doc.data()!;
    return SocialMediaUser(
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      provider: data['provider'],
      uid: data['uid'],
      phoneNumber: data['phoneNumber'],
      address: data['address'],
      comments: data['comments'],
      posts: data['posts'],
    );
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

  void updateUser(
      { required SocialMediaUser user}) async {
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
}
