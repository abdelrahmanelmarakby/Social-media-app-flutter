import 'package:get/get.dart';

import '../controllers/create_post_bottom_sheet_controller.dart';

class CreatePostBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePostBottomSheetController>(
      () => CreatePostBottomSheetController(),
    );
  }
}
