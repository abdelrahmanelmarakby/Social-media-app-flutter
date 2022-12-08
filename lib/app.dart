import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:future_chat/core/services/dynamic_links.dart';
import 'package:future_chat/core/services/encryption_service.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:uni_links/uni_links.dart';

import 'app/routes/app_pages.dart';
import 'core/language/translations_service.dart';
import 'core/others/error_screen.dart';
import 'core/others/intial_widget.dart';
import 'core/services/bindings.dart';
import 'core/services/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final botToastBuilder = BotToastInit();
  Uri? _initialURI;
  Uri? _currentURI;
  Object? _err;

  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    const string = "THis is the first encrypted log";
    Get.log("${string.encrypt} ${string.encrypt.decrypt}");
    //  _initURIHandler();
    //  _incomingLinkHandler();
  }

  Future<void> _initURIHandler() async {
    if (!Get.find<DynamicLinkService>().initialURILinkHandled) {
      Get.find<DynamicLinkService>().initialURILinkHandled = true;
      BotToast.showText(
        text: "Invoked _initURIHandler",
      );
      try {
        final initialURI = await getInitialUri();
        // Use the initialURI and warn the user if it is not correct,
        // but keep in mind it could be `null`.
        if (initialURI != null) {
          debugPrint("Initial URI received $initialURI");
          if (!mounted) {
            return;
          }
          setState(() {
            _initialURI = initialURI;
          });
        } else {
          debugPrint("Null Initial URI received");
        }
      } on PlatformException {
        // Platform messages may fail, so we use a try/catch PlatformException.
        // Handle exception by warning the user their action did not succeed
        debugPrint("Failed to receive initial uri");
      } on FormatException catch (err) {
        if (!mounted) {
          return;
        }
        debugPrint('Malformed Initial URI received');
        setState(() => _err = err);
      }
    }
  }

  /// Handle incoming links - the ones that the app will receive from the OS
  /// while already started.
  void _incomingLinkHandler() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (!mounted) {
          return;
        }
        debugPrint('Received URI: $uri');

        setState(() {
          _currentURI = uri;
          Get.log("Received URI: $uri");
          Get.toNamed("/%{uri?.queryParameters['path']}",
              arguments: uri?.queryParameters['id']);
          _err = null;
        });
      }, onError: (Object err) {
        if (!mounted) {
          return;
        }
        debugPrint('Error occurred: $err');
        setState(() {
          _currentURI = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        // navigatorObservers: [BotToastNavigatorObserver()],
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
        onInit: () {
          Get.log("onInit called => ${Get.currentRoute} ${_currentURI?.path}");
        },
        themeMode: ThemeService().theme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('en'),
        fallbackLocale: TranslationsService.fallbackLocale,
        supportedLocales: TranslationsService.supportedLocales,
        translations: TranslationsService(),
        defaultTransition: Transition.fadeIn,

        //  logWriterCallback: (String text, {bool isError = false}) {
        //  Get.log("GET LOG CALLBACK : $text", isError: isError);
        //},

        builder: (context, child) {
          //  child = botToastBuilder(context, child);
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomError(errorDetails: errorDetails);
          };
          child = botToastBuilder(context, child);
          return ResponsiveWrapper.builder(child,
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
