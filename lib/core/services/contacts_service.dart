import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:get/get.dart';

class ContactsService extends GetxService {
  static Future<List<Contact>> getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      return await FlutterContacts.getContacts(
        withPhoto: true,
        withProperties: true,
        withThumbnail: true,
        sorted: true,
        deduplicateProperties: false,
        withAccounts: true,
      );
    } else {
      return Future.error('Permission denied');
    }
  }

  static Future<void> getAllRegisterdContacts() async {
    Get.log("Getting all registerd contacts");
    List<Contact> contacts = await getContacts();
    Get.log("Contacts length ${contacts.length}");
    Get.log("Getting all Firebae contacts");
    List<SocialMediaUser> firbaseUsers = await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((value) {
      return value.docs
          .map((e) => SocialMediaUser(
                email: e.data()['email'],
                firstName: e.data()['firstName'],
                lastName: e.data()['lastName'],
                phoneNumber: e.data()['phoneNumber'],
                uid: e.data()['uid'],
                photoUrl: e.data()['photoUrl'],
                bio: e.data()["bio"],
              ))
          .toList();
    });
    Get.log("Firebase users length ${firbaseUsers.length}");

    List<String> registeredContacts = [];
    //TODO :: OPTIMIZE THIS CODE TO BE MORE EFFICIENT AND FAST O(N^3) = BAD
    for (var contact in contacts) {
      for (var phone in contact.phones) {
        for (var user in firbaseUsers) {
          print(user.phoneNumber);
          print(phone.number);
          if (phone.number == user.phoneNumber) {
            print(" ${user.firstName} is registered");
            registeredContacts.add(user.uid ?? "");
          }
        }
      }
    }
    registeredContacts = registeredContacts.toSet().toList();
    Get.log("Registered contacts length ${registeredContacts.length}");
    Get.log("Updating user contacts $registeredContacts");
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "followers": registeredContacts,
      "following": registeredContacts.toSet().toList()
    });

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "followers": registeredContacts,
      "following": registeredContacts
    }).then((value) async {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        UserService.myUser = SocialMediaUser(
          email: value.data()?['email'],
          firstName: value.data()?['firstName'],
          lastName: value.data()?['lastName'],
          phoneNumber: value.data()?['phoneNumber'],
          uid: value.data()?['uid'],
          photoUrl: value.data()?['photoUrl'],
          bio: value.data()?['bio'],
          followers: value.data()?['followers'],
          following: value.data()?['following'],
          posts: value.data()?['posts'],
          stories: value.data()?['stories'],
          comments: value.data()?['comments'],
          address: value.data()?['address'],
        );
      });
    });
  }
}
