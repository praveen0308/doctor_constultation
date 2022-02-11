import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/widgets/membership.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyPlan extends StatelessWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AppBackNavBar(
              imgUrl: AppImages.icBackArrow,
              txtTitle: "My Plan",
              navColor: AppColors.primary,
              bgColor: AppColors.greyLightest,
            ),
            TemplateMembership(
              txtTitle: AppStrings.planTitle1,
              txtSubTitle: AppStrings.planSubTitle1,
              txtCaption: AppStrings.planCaption1,
            ),
            TemplateMembership(
              txtTitle: AppStrings.planTitle2,
              txtSubTitle: AppStrings.planSubTitle2,
              txtCaption: AppStrings.planCaption2,
              checkColor: AppColors.greyLightest,
              borderColor: AppColors.greyLightest,
            )
          ],
        ),
      ),
    );
  }
}
