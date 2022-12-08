import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/profile_notification_controller.dart';

class ProfileNotificationView extends GetView<ProfileNotificationController> {
  const ProfileNotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          GestureDetector(
            child: AppBar(
              leading: const Icon(
                Iconsax.arrow_left,
                color: ColorsManger.black,
              ),
              title: Text(
                'Notification',
                style: getBoldTextStyle(
                  color: ColorsManger.black, fontWeight: null,
                ),
              ),
              centerTitle: false,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            onTap: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      )),
    );
  }
}
