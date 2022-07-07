import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const primarySwatchColor = MaterialColor(0xFF9BCDD6, {
    50: Color.fromRGBO(155, 205, 214, .1),
    100: Color.fromRGBO(155, 205, 214, .2),
    200: Color.fromRGBO(155, 205, 214, .3),
    300: Color.fromRGBO(155, 205, 214, .4),
    400: Color.fromRGBO(155, 205, 214, .5),
    500: Color.fromRGBO(155, 205, 214, .6),
    600: Color.fromRGBO(155, 205, 214, .7),
    700: Color.fromRGBO(155, 205, 214, .8),
    800: Color.fromRGBO(155, 205, 214, .9),
    900: Color.fromRGBO(155, 205, 214, 1),
  });

  //Primary Color
  static const primaryLightest = Color(0XFFE0E8FA);
  static const primaryLight = Color(0XFFE0E8FA);
  static const primary = Color(0XFF9BCDD6);
  static const primaryDark = Color(0XFF10295D);
  static const primaryDarkest = Color(0XFF050E1F);

  //Error Color
  static const errorLightest = Color(0XFFFAE2E0);
  static const errorLight = Color(0XFFF0A8A1);
  static const error = Color(0XFFDC3423);
  static const errorDark = Color(0XFF5E160F);
  static const errorDarkest = Color(0XFF1F0705);

  //Warning Color
  static const warningLightest = Color(0XFFFAF2E0);
  static const warningLight = Color(0XFFF0D8A1);
  static const warning = Color(0XFFDBA524);
  static const warningDark = Color(0XFF5E470F);
  static const warningDarkest = Color(0XFF1F1805);

  //Success Color
  static const successLightest = Color(0XFFDBFFED);
  static const successLight = Color(0XFF92FFC9);
  static const success = Color(0XFF00FF80);
  static const successDark = Color(0XFF006D37);
  static const successDarkest = Color(0XFF002412);

  //Grey Color
  static const greyLightest = Color(0XFFfafcfe);
  static const greyLight = Color(0XFFbcc0c3);
  static const greyBefore = Color(0XFF8e979b);
  static const grey = Color(0XFF646c70);
  static const greyDark = Color(0XFF3c4143);
  static const greyDarkest = Color(0XFF141616);
}
