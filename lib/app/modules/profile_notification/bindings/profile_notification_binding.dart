import 'package:get/get.dart';

import '../controllers/profile_notification_controller.dart';

class ProfileNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileNotificationController>(
      () => ProfileNotificationController(),
    );
  }
}
