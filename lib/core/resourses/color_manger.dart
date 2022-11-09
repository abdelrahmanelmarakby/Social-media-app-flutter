import 'package:flutter/material.dart';

class ColorsManger {
  static const Color primary = Color(0xff0077B6);
  static const Color darkGrey = Color(0xFF484848);
  static const Color hintTextColor = Color(0xFF738594);
  static const Color grey = Color(0xFF757575);
  static const Color lightGrey = Color(0xFFBDBDBD);
  static const Color grey1 = Color(0xFFF3F5F7);
  static const Color white = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color success = Color(0xFF00C853);
  static const Color red = Color(0xFFFF0000);
  static const Color black = Color(0xFF000000);
  static const Color blue = Color(0xFF35517A);
  static const Color dotColor = Color(0xFF3E4F94);
  static const Color lightBlue = Color(0xFF009AE2);
  static const Color pink = Color(0xFFF72585);
  static const Color yellow = Color(0xFFFDC500);

  static const LinearGradient simpleGradients = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF3548AE),
      Color(0xFFA324D6),
    ],
    stops: [0.3, 0.7],
  );
  static const LinearGradient multiGradients = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF13B1AD),
      Color(0xFFD52DF2),
    ],
    stops: [0.1, 0.9],
  );
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF1E96FC),
      Color(0xff80DC74),
    ],
  );
}
