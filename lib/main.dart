import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_chat/core/services/dynamic_links.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'app.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/services/localization_service.dart';
import 'core/services/shared_prefs.dart';

Future<void> main() async {
  //============================================================================
  WidgetsFlutterBinding.ensureInitialized();
  //=============================== Firebase ====================================
  await Firebase.initializeApp();
  Get.put(DynamicLinkService());
  //=============================== Contacts ======================================
  FlutterContacts.config.includeNotesOnIos13AndAbove = true;
  FlutterContacts.config.includeNonVisibleOnAndroid = true;
  //============================== Shared Preferences =================================
  SharedPreferences pref = await SharedPreferences.getInstance();
  Get.put(SharedPrefService(prefs: pref));
  //============================== Localization =================================
  Get.put(LocalizationService());

  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  //============================================================================
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
  //============================================================================
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://7d857f1766ca4c57a9a8e72e94ddc970@o1189629.ingest.sentry.io/4504112367599616';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.

      options.tracesSampleRate = 0.0;
    },
    //============================================================================
    appRunner: () => runApp(const MyApp()),
  );
}
