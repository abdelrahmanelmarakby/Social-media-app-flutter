import 'package:get/get.dart';

import '../controllers/share_bottom_sheet_controller.dart';

class ShareBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareBottomSheetController>(
      () => ShareBottomSheetController(),
    );
  }
}
