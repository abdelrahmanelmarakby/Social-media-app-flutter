import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:future_chat/core/services/contacts_service.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'widget/contacts.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.white,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: ColorsManger.black,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: '1',
                child: const Text('Edit Profile'),
                onTap: () => Get.offNamed(Routes.SIGNUP),
              ),
              PopupMenuItem<String>(
                onTap: () {
                  //sign out from firebase
                  FirebaseAuth.instance.signOut();
                  Get.forceAppUpdate();
                  //sign out from google
                },
                value: '2',
                child: const Text('Logout'),
              ),
              PopupMenuItem<String>(
                onTap: () async {
                  BotToast.showLoading();
                  await ContactsService.getAllRegisterdContacts();
                  Get.forceAppUpdate();
                  BotToast.closeAllLoading();
                },
                value: '4',
                child: const Text('Refresh Contacts'),
              ),
              PopupMenuItem<String>(
                value: '3',
                onTap: () {
                  FirebaseFirestore.instance
                      .collection("Users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .delete();
                  FirebaseAuth.instance.currentUser?.delete();
                  Get.offAndToNamed(Routes.INTRO);
                },
                child: const Text(
                  'delete account',
                  style: TextStyle(color: ColorsManger.error),
                ),
              ),
            ],
          ),
        ],
        title: Text(
          'Profile',
          style: getBoldTextStyle(
            color: ColorsManger.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: const [
          ProfileHeader(),
          Divider(),
          ProfileStats(),
          Divider(),
          ProfileInfo(),
          Divider(),
          ProfilePosts()
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: const [
            Text("Stories"),
            //    Text((UserService.myUser?.stories?.length ?? 0).toString())
          ],
        ),
        Column(
          children: const [
            Text("Posts"),
            //   Text((UserService.myUser?.posts?.length ?? 0).toString())
          ],
        ),
        Column(
          children: const [
            Text("Comments"),
            //   Text((UserService.myUser?.comments?.length ?? 0).toString())
          ],
        ),
        InkWell(
          onTap: () {
            Get.bottomSheet(
                ContactsView(contacts: UserService.myUser?.followers ?? []));
          },
          child: Column(
            children: [
              const Text("Contacts"),
              Text((UserService.myUser?.followers?.length).toString())
            ],
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 12);
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            UserService.myUser?.photoUrl ?? '',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
            ProfileTile(
              title: 'Name',
              subtitle:
                  '${UserService.myUser?.firstName} ${UserService.myUser?.lastName}',
            ),
            ProfileTile(
              title: 'Email',
              subtitle: UserService.myUser?.email ?? 'No Email',
            ),
            ProfileTile(
              title: 'Phone',
              subtitle: UserService.myUser?.phoneNumber ?? 'No Phone',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Posts"),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: getRegularTextStyle(fontSize: 14, color: Colors.grey)),
      subtitle: Text(
        subtitle,
        style: getMediumTextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
