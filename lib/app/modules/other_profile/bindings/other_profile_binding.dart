import 'package:get/get.dart';

import '../controllers/other_profile_controller.dart';

class OtherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherProfileController>(
      () => OtherProfileController(),
    );
  }
}
