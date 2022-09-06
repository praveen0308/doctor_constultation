import 'dart:async';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _storage = SecureStorage();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      var loginStatus = await _storage.getLoginStatus();
      var roleID = await _storage.getUserRoleId();
      if (loginStatus) {
        if (roleID == UserRoles.doctor) {
          Navigator.pushReplacementNamed(context, route.dashboardDoctor);
        } else {
          Navigator.pushReplacementNamed(context, route.dashboardPatient);
        }
      } else {
        Navigator.pushReplacementNamed(context, route.dashboardPatient);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(AppImages.imgLogo),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.drName,
                style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: AppStrings.slogan1,
                        style: AppTextStyle.body1(txtColor: AppColors.primary)),
                    TextSpan(
                        text: AppStrings.slogan2,
                        style: AppTextStyle.body1(txtColor: AppColors.greyDark)),
                  ]),
                ),
              ),
              const Expanded(
                  child: SpinKitCircle(
                color: AppColors.primary,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
