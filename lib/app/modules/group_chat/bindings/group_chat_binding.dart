import 'package:get/get.dart';

import '../controllers/group_chat_controller.dart';

class GroupChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupChatController>(
      () => GroupChatController(),
    );
  }
}
