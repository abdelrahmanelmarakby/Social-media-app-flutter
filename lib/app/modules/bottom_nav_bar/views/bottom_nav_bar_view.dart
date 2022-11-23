import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (controller) => Scaffold(
        body: controller.CurrentScreen,
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  _bottomNavigationBar() {
    return GetBuilder<BottomNavBarController>(
      init: BottomNavBarController(),
      autoRemove: true,
      global: true,
      builder: (controller) => SafeArea(
        child: AnimatedBottomNavigationBar(
          bottomBarItems: [
            BottomBarItemsModel(
              icon: const Icon(
                Iconsax.home,
              ),
              iconSelected: const Icon(
                Iconsax.home,
                color: ColorsManger.primary,
              ),
              title: "Home",
              titleStyle: getMediumTextStyle(fontSize: 10),
              dotColor: ColorsManger.primary,
              onTap: () => controller.onSelected(0),
            ),
            BottomBarItemsModel(
              icon: const Icon(
                Iconsax.message,
              ),
              iconSelected: const Icon(
                Iconsax.message,
                color: ColorsManger.primary,
              ),
              title: "Chat",
              titleStyle: getMediumTextStyle(fontSize: 10),
              dotColor: ColorsManger.primary,
              onTap: () => controller.onSelected(1),
            ),
            BottomBarItemsModel(
              icon: const Icon(
                Iconsax.notification,
              ),
              iconSelected: const Icon(
                Iconsax.notification,
                color: ColorsManger.primary,
              ),
              title: "Notification",
              titleStyle: getMediumTextStyle(fontSize: 10),
              dotColor: ColorsManger.primary,
              onTap: () => controller.onSelected(3),
            ),
            BottomBarItemsModel(
              icon: const Icon(
                Iconsax.user,
              ),
              iconSelected: const Icon(
                Iconsax.user,
                color: ColorsManger.primary,
              ),
              title: "Profile",
              dotColor: ColorsManger.primary,
              titleStyle: getLightTextStyle(fontSize: 10),
              onTap: () => controller.onSelected(4),
            ),
          ],
          bottomBarCenterModel: BottomBarCenterModel(
            centerBackgroundColor: ColorsManger.primary,
            centerIcon: FloatingCenterButton(
              onAnimationComplete: () {
                Navigator.pop(Get.context!);
              },
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
            centerIconChild: [
              FloatingCenterButtonChild(
                child: const Icon(
                  Iconsax.story,
                  color: AppColors.white,
                ),
                onTap: () {
                  Get.toNamed(Routes.ADD_STORY);
                },
              ),
              FloatingCenterButtonChild(
                child: const Icon(
                  Iconsax.magicpen,
                  color: AppColors.white,
                ),
                onTap: () {
                  Get.toNamed(Routes.ADD_POST);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
