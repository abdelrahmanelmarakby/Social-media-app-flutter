import 'package:flutter/material.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/profile_notification/views/profile_notification_view.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:future_chat/app/modules/edit_profile/views/edit_profile_view.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../account/views/account_view.dart';
import '../../help/views/help_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(
                Iconsax.arrow_left,
                color: ColorsManger.black,
              ),
              title: Text(
                'Profile',
                style: getBoldTextStyle(
                  color: ColorsManger.black,
                ),
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: ListTile(
            leading: Container(
              height: 90,
              width: 90,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage(UserService.myUser?.photoUrl ?? ''),
              ),
            ),
            title: Text(
              '${UserService.myUser?.firstName} ${UserService.myUser?.lastName}',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 18),
            ),
            subtitle: Text(
              'Edit Profile',
              style: getMediumTextStyle(color: ColorsManger.grey, fontSize: 12),
            ),
            onTap: () {
              Get.to(() => const EditProfileView());
            },
          )),
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: ListTile(
            leading: CircleAvatar(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorsManger.light,
                ),
                child: const Icon(
                  Iconsax.key,
                  color: ColorsManger.primary,
                ),
              ),
            ),
            title: Text(
              'Account',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
            ),
            subtitle: Text(
              'Privacy, Delete Account',
              style: getMediumTextStyle(color: ColorsManger.grey, fontSize: 12),
            ),
            onTap: () {
              Get.to(() => const AccountView());
            },
          )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListTile(
            leading: CircleAvatar(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorsManger.light,
                ),
                child: const Icon(
                  Iconsax.notification,
                  color: ColorsManger.primary,
                ),
              ),
            ),
            title: Text(
              'Notifications',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
            ),
            subtitle: Text(
              'messages, group and others',
              style: getMediumTextStyle(color: ColorsManger.grey, fontSize: 12),
            ),
            onTap: () {
              Get.to(() => const ProfileNotificationView());
            },
          )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListTile(
            leading: CircleAvatar(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorsManger.light,
                ),
                child: const Icon(
                  Iconsax.warning_2,
                  color: ColorsManger.primary,
                ),
              ),
            ),
            title: Text(
              'Help',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
            ),
            subtitle: Text(
              'Help center, contact us, privacy policy',
              style: getMediumTextStyle(color: ColorsManger.grey, fontSize: 12),
            ),
            onTap: () {
              Get.to(() => const HelpView());
            },
          )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListTile(
            leading: CircleAvatar(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorsManger.light,
                ),
                child: const Icon(
                  Iconsax.profile_2user,
                  color: ColorsManger.primary,
                ),
              ),
            ),
            title: Text(
              'Invite a Friend',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
            ),
            onTap: () {},
          )),
          const SizedBox(
            height: 270,
          )
        ],
      ),
    );
  }
}
