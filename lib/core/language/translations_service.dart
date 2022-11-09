import 'dart:ui';

import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';

///Locales class to support multi languages(ar,en) in the app
///
///the default locale is (device locale)
///
///Change Locale Like this
///```dart
///Get.find<LocalizationService>().setLocale(NEW LOCALE,Restart app?(True,false))
///```
///you maybe want to restart the app when you want to resend all the APIs with the new value of your language header if not, `false` will be a good choice
class TranslationsService extends Translations {
  static const fallbackLocale = Locale("en");
  static const supportedLocales = <Locale>[Locale('en'), Locale('ar')];
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
