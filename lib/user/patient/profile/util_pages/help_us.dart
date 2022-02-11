import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/user/patient/profile/util_pages/help_us_body.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HelpUs extends StatelessWidget {
  const HelpUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              AppBackNavBar(
                imgUrl: AppImages.icBackArrow,
                txtTitle: "Help Us",
                navColor: AppColors.primary,
                bgColor: AppColors.greyLightest,
              ),
              HelpUsBodyPage()
            ],
          ),
        ),
      ),
    );
  }
}
