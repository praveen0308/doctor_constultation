import 'package:doctor_consultation/common/auth/login.dart';
import 'package:doctor_consultation/common/splash_screen.dart';
import 'package:doctor_consultation/common/success_view.dart';
import 'package:doctor_consultation/common/welcome_user_type.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/route/route.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: AppColors.primarySwatchColor,
          scaffoldBackgroundColor: AppColors.greyLightest),
      initialRoute: route.splashScreen,
      onGenerateRoute: route.controller,
    );
  }
}
