import 'package:get/get.dart';

import '../controllers/add_story_controller.dart';

class AddStoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddStoryController>(
      () => AddStoryController(),
    );
  }
}
