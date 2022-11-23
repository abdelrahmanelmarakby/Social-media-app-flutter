import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:future_chat/core/others/intial_widget.dart';
import 'package:future_chat/core/services/bindings.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/routes/app_pages.dart';
import 'core/language/translations_service.dart';
import 'core/others/error_screen.dart';

import 'core/services/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final botToastBuilder = BotToastInit();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorObservers: [BotToastNavigatorObserver()],
        title: "app name".tr,
        // initialRoute:token==null?AppPages.INITIAL:Routes.HOME,
        //initialRoute: AppPages.INITIAL,
        home: const CheckSigningIn(),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        darkTheme: Themes.dark,
        // <-- dark theme
        theme: Themes.light,
        // <-- light theme
        themeMode: ThemeService().theme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Get.deviceLocale,
        fallbackLocale: TranslationsService.fallbackLocale,
        supportedLocales: TranslationsService.supportedLocales,
        translations: TranslationsService(),
        defaultTransition: Transition.fadeIn,

        //  logWriterCallback: (String text, {bool isError = false}) {
        //  Get.log("GET LOG CALLBACK : $text", isError: isError);
        //},
        builder: (context, child) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomError(errorDetails: errorDetails);
          };

          child = botToastBuilder(context, child!);
          return ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, child),
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(350, name: MOBILE),
                const ResponsiveBreakpoint.resize(600, name: TABLET),
                const ResponsiveBreakpoint.resize(800, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
              ],
              background: Container(color: const Color(0xFFF5F5F5)));
        },
        enableLog: true,
        initialBinding: InitialBinding());
  }
}
