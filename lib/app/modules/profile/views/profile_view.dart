import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/profile_notification/views/profile_notification_view.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:future_chat/core/services/dynamic_links.dart';
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
        title: Text('Profile',
            style: getBoldTextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                child: ListTile(
                  leading: SizedBox(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        UserService.myUser?.photoUrl ?? "",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Iconsax.user,
                            color: ColorsManger.black,
                          );
                        },
                      ),
                    ),
                  ),
                  title: Text(
                    '${UserService.myUser?.firstName} ${UserService.myUser?.lastName}',
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 18),
                  ),
                ),
              )),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                    child: GestureDetector(
                  child: ListTile(
                    leading: ClipRRect(
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
                      style: getMediumTextStyle(
                          color: ColorsManger.black, fontSize: 16),
                    ),
                    subtitle: Text(
                      'Edit Profile, Delete Account',
                      style: getMediumTextStyle(
                          color: ColorsManger.grey, fontSize: 12),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => const AccountView());
                  },
                )),
                Expanded(
                    child: GestureDetector(
                  child: ListTile(
                    leading: ClipRRect(
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
                      style: getMediumTextStyle(
                          color: ColorsManger.black, fontSize: 16),
                    ),
                    subtitle: Text(
                      'messages, group and others',
                      style: getMediumTextStyle(
                          color: ColorsManger.grey, fontSize: 12),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => const ProfileNotificationView());
                  },
                )),
                Expanded(
                    child: GestureDetector(
                  child: ListTile(
                    leading: ClipRRect(
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
                      style: getMediumTextStyle(
                          color: ColorsManger.black, fontSize: 16),
                    ),
                    subtitle: Text(
                      'Help center, contact us, privacy policy',
                      style: getMediumTextStyle(
                          color: ColorsManger.grey, fontSize: 12),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => const HelpView());
                  },
                )),
                Expanded(
                    child: GestureDetector(
                  child: ListTile(
                    leading: ClipRRect(
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
                      style: getMediumTextStyle(
                          color: ColorsManger.black, fontSize: 16),
                    ),
                  ),
                  onTap: () async {
                    Uri? link = await DynamicLinkService().createDynamicLink(
                        "invite", UserService.myUser?.uid ?? "");
                    AppinioSocialShare().shareToSystem(
                      "Join me on Future Chat",
                      "Join me on Future Chat and let's chat by using this link ${link.toString()}",
                    );
                  },
                )),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
