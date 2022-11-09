import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manger.dart';
import 'font_manger.dart';
import 'styles_manger.dart';
import 'values_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of the app
    scaffoldBackgroundColor: ColorsManger.white,
    primaryColor: ColorsManger.primary,
    primaryColorLight: ColorsManger.primary.withOpacity(.7),
    disabledColor: ColorsManger.grey1,
    platform: TargetPlatform.iOS,
    splashColor: ColorsManger.primary.withOpacity(.7),
    fontFamily: FontConstants.fontName,

    //card theme for the cards
    cardTheme: CardTheme(
      color: ColorsManger.white,
      shadowColor: ColorsManger.grey,
      elevation: AppSize.size4,
      margin: const EdgeInsets.all(AppMargin.margin8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: AppSize.size4,
      iconTheme: const IconThemeData(color: ColorsManger.white),
      backgroundColor: ColorsManger.primary,
      shadowColor: ColorsManger.primary.withOpacity(.7),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffdddeee), // Navigation bar
        statusBarColor: Color(0xffdddeee), // Status bar
      ),
      titleTextStyle: getRegularTextStyle(
          color: ColorsManger.white, fontSize: AppSize.size18),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsManger.primary,
      disabledColor: ColorsManger.grey1,
      splashColor: ColorsManger.primary.withOpacity(.7),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManger.primary,
        textStyle: getRegularTextStyle(
          color: ColorsManger.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManger.primary,
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        unselectedItemColor: ColorsManger.grey,
        selectedLabelStyle:
            getBoldTextStyle(color: Colors.white, fontSize: FontSize.large),
        unselectedLabelStyle: getRegularTextStyle(
            color: ColorsManger.grey, fontSize: FontSize.medium)),
    textTheme: TextTheme(
      headline1: getMediumTextStyle(
          color: ColorsManger.darkGrey, fontSize: AppSize.size18),
      subtitle1: getMediumTextStyle(
          color: ColorsManger.grey, fontSize: AppSize.size16),
      subtitle2: getMediumTextStyle(
          color: ColorsManger.darkGrey, fontSize: AppSize.size14),
      caption: getMediumTextStyle(
        color: ColorsManger.darkGrey,
        fontSize: AppSize.size18,
      ),
      bodyText1: getRegularTextStyle(color: ColorsManger.grey),
    ),
    inputDecorationTheme: InputDecorationTheme(
      //border
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: ColorsManger.hintTextColor.withOpacity(.3),
          width: .1,
        ),
      ),
      //hint text style
      hintStyle: getRegularTextStyle(color: ColorsManger.grey),
      //focused ERROR border
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManger.hintTextColor.withOpacity(.3),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManger.error.withOpacity(.3),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManger.hintTextColor.withOpacity(.3),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      suffixStyle: getMediumTextStyle(color: ColorsManger.grey),
      focusColor: ColorsManger.success,
      //focused ERROR hint text style
      errorStyle: getRegularTextStyle(color: ColorsManger.error),
      //focused Label text style
      labelStyle: getMediumTextStyle(color: ColorsManger.lightBlue),
      filled: true,
      fillColor: ColorsManger.grey1,

      ///fill COLOR
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppPadding.padding20,
        horizontal: AppPadding.padding16,
      ),
    ),
  );
}
