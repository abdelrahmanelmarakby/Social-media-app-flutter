import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pandabar/pandabar.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (controller) => Scaffold(
        extendBody: true,
        body: controller.CurrentScreen,
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  _bottomNavigationBar() {
    return GetBuilder<BottomNavBarController>(
      builder: (controller) => SafeArea(
        child: PandaBar(
          backgroundColor: ColorsManger.grey1,
          fabIcon: IconButton(
            icon: const Icon(Iconsax.add),
            onPressed: () {
              controller.onSelected(2);
            },
          ),
          fabColors: const [
            ColorsManger.primary,
            Color.fromARGB(255, 31, 177, 255)
          ],
          buttonSelectedColor: ColorsManger.primary,
          buttonData: [
            PandaBarButtonData(
              id: 0,
              icon: Iconsax.home,
              title: 'Home',
            ),
            PandaBarButtonData(id: 1, icon: Iconsax.messages, title: 'Chat'),
            PandaBarButtonData(
              id: 3,
              icon: Iconsax.notification,
              title: 'Notification',
            ),
            PandaBarButtonData(id: 4, icon: Iconsax.user, title: 'Profile'),
          ],
          onChange: (index) => controller.onSelected(index),
          onFabButtonPressed: () {},
        ),
      ),
    );
  }
}
