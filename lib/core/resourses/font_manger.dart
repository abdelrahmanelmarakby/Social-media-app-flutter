import 'package:flutter/material.dart';
import 'package:future_chat/core/services/shared_prefs.dart';
import 'package:get/get.dart';

class FontConstants {
  static String fontName = Get.find<SharedPrefService>().loadLocale() == "ar"
      ? 'Tajawal'
      : "Poppins";
}

class FontWeights {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double xSmall = 8.0;
  static const double small = 12.0;
  static const double medium = 14.0;
  static const double large = 16.0;
  static const double xlarge = 18.0;
  static const double xXlarge = 20.0;
}
