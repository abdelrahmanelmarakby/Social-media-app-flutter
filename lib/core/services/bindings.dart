import 'package:future_chat/app/modules/chats/controllers/chats_controller.dart';
import 'package:future_chat/app/modules/home/controllers/home_controller.dart';
import 'package:future_chat/app/modules/login/controllers/login_controller.dart';
import 'package:future_chat/app/modules/notifications/controllers/notifications_controller.dart';
import 'package:future_chat/app/modules/profile/controllers/profile_controller.dart';
import 'package:future_chat/app/modules/signup/controllers/signup_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ChatsController>(() => ChatsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
