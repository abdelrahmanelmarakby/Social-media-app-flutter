import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

import 'package:get/get.dart';

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
                  CupertinoIcons.home,

                  //  color: Colors.green,
                ),
                title: const Text(
                  "explore",
                )),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  CupertinoIcons.chat_bubble_2,
                  //color: Colors.green,
                ),
                title: const Text("Chats")),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Icons.add,
                ),
                title: const Text("profile")),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Icons.notifications_outlined,
                ),
                title: const Text("news")),
            FlashyTabBarItem(
                inactiveColor: ColorsManger.primary,
                activeColor: Colors.black,
                icon: const Icon(
                  Icons.account_circle_outlined,
                ),
                title: const Text("profile")),
          ],
          onItemSelected: (index) {
            controller.onSelected(index);
          }),
    );
  }
}
