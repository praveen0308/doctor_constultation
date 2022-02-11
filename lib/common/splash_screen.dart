import 'dart:async';

import 'package:doctor_consultation/common/auth/login.dart';
import 'package:doctor_consultation/common/welcome_user_type.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),() => Navigator.push(context, MaterialPageRoute(builder: (context) =>LayoutUserType()))
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight

    ));
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
              Text(AppStrings.drName,style: AppTextStyle.headline5(txtColor: AppColors.greyDark),),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: AppStrings.slogan1,style: AppTextStyle.body1(txtColor: AppColors.primary)),
                    TextSpan(text: AppStrings.slogan2,style: AppTextStyle.body1(txtColor: AppColors.greyDark)),
                  ]
                ),
              ),

              Expanded(child: SpinKitCircle(color: AppColors.primary,))
            ],
          ),
        ),
      ),
    );
  }
}
