import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PatientReviewList extends StatelessWidget {
  const PatientReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              AppBackNavBar(
                imgUrl: AppImages.icBackArrow,
                txtTitle: "Patient Review",
                navColor: AppColors.primary,
                bgColor: AppColors.greyLightest,
              )
            ],
          ),
        ),
      ),
    );
  }
}
