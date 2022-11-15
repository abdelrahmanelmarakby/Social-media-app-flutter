import 'package:get/get.dart';

import '../controllers/add_post_bottom_sheet_controller.dart';

class AddPostBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPostBottomSheetController>(
      () => AddPostBottomSheetController(),
    );
  }
}
