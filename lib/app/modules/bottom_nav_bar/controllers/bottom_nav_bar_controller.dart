import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/add_post_bottom_sheet/views/add_post_bottom_sheet_view.dart';
import 'package:future_chat/app/modules/chat/views/chat_history.dart';
import 'package:future_chat/app/modules/home/views/home_view.dart';
import 'package:future_chat/app/modules/notifications/views/notifications_view.dart';
import 'package:future_chat/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
    super.onInit();
  }

  Widget _currentScreen = const HomeView();

  // ignore: non_constant_identifier_names
  get CurrentScreen => _currentScreen;

  int _navIndex = 0;
  get navIndex => _navIndex;
  onSelected(int index) {
    _navIndex = index;
    switch (index) {
      case 0:
        {
          _currentScreen = const HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = ChatHistory(
            myId: UserService.myUser?.phoneNumber
                    ?.replaceAll(RegExp("[^a-zA-Z0-9 ]"), "") ??
                "",
          );

          break;
        }
      case 2:
        {
          Get.bottomSheet(const AddPostBottomSheetView());
          break;
        }
      case 3:
        {
          _currentScreen = const NotificationsView();
          break;
        }
      case 4:
        {
          _currentScreen = const ProfileView();
          break;
        }
    }
    update();
  }
}
