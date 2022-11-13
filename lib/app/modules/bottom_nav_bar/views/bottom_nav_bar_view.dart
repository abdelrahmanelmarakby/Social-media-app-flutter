import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/bottom_nav_bar_controller.dart';

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
      builder: (controller) => FlashyTabBar(
          showElevation: false,
          animationDuration: const Duration(milliseconds: 250),
          backgroundColor: ColorsManger.grey1,
          selectedIndex: controller.navIndex,
          items: [
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Iconsax.home_2,

                  //  color: Colors.green,
                ),
                title: const Text(
                  "explore",
                )),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Iconsax.messages,
                  //color: Colors.green,
                ),
                title: const Text("Chats")),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Iconsax.add,
                ),
                title: const Text("post")),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Iconsax.notification,
                ),
                title: const Text("news")),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Iconsax.user,
                ),
                title: const Text("profile")),
          ],
          onItemSelected: (index) {
            controller.onSelected(index);
          }),
    );
  }
}
