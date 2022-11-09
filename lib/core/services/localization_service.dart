import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shared_prefs.dart';

class LocalizationService extends GetxService {
  @override
  void onInit() {
    Get.updateLocale(Locale(Get.find<SharedPrefService>().loadLocale()));
    super.onInit();
  }

  setLocale(String newLang, [bool isWithRestart = false]) async {
    await Get.find<SharedPrefService>().saveLocale(newLang);
    Get.updateLocale(Locale(newLang));
    if (isWithRestart) {
      Get.forceAppUpdate();
    }
  }

  bool isAr() {
    return Get.locale?.languageCode == 'ar';
  }
}
