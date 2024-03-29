import 'package:flutter/widgets.dart';

import 'font_manger.dart';

//TextStyle builder method
TextStyle _getTextStyle({
  double? fontSize,
  String? fontFamily,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    overflow: TextOverflow.ellipsis
  );
}

///regular TextStyle
TextStyle getRegularTextStyle(
    {double fontSize = FontSize.small, Color? color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontName,
      color: color,
      fontWeight: FontWeights.regular);
}

///light TextStyle
TextStyle getLightTextStyle({double fontSize = FontSize.small, Color? color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontName,
      color: color,
      fontWeight: FontWeights.light);
}

///medium TextStyle
TextStyle getMediumTextStyle({double fontSize = FontSize.small, Color? color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontName,
      color: color,
      fontWeight: FontWeights.medium);
}

///bold TextStyle
TextStyle getBoldTextStyle(
    {double fontSize = FontSize.large, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontName,
      color: color,
      fontWeight: FontWeights.bold);
}
