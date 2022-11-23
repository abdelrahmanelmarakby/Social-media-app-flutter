import 'package:get/get.dart';

import '../controllers/video_chat_controller.dart';

class VideoChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoChatController>(
      () => VideoChatController(),
    );
  }
}
