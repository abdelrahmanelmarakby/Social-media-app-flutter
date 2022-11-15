import 'package:future_chat/app/modules/add_post/controllers/add_post_controller.dart';
import 'package:future_chat/app/modules/home/controllers/home_controller.dart';
import 'package:future_chat/app/modules/intro/controllers/intro_controller.dart';
import 'package:future_chat/app/modules/login/controllers/login_controller.dart';
import 'package:future_chat/app/modules/notifications/controllers/notifications_controller.dart';
import 'package:future_chat/app/modules/profile/controllers/profile_controller.dart';
import 'package:future_chat/app/modules/signup/controllers/signup_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPostController>(
      () => AddPostController(),
    );
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<IntroController>(() => IntroController());
  }
}
