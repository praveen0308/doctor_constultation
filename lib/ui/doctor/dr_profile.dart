import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/doctor/dr_profile_body.dart';
import 'package:doctor_consultation/ui/doctor/dr_profile_header.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrProfilePage extends StatefulWidget {
  const DrProfilePage({Key? key}) : super(key: key);

  @override
  _DrProfilePageState createState() => _DrProfilePageState();
}

class _DrProfilePageState extends State<DrProfilePage> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
    super.dispose();
  }



  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.greyLight,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const <Widget>[
              AppBackNavBar(
                imgUrl: AppImages.icBackArrow,
                navColor: AppColors.greyLightest,
                bgColor: AppColors.primary,
              ),
              DrProfileHeader(),
              DrProfileBody(),
            ],
          ),
        ),
      ),
    );
  }
}
