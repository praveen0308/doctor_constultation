import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/widgets/view_fact_myth.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FactMythList extends StatelessWidget {
  const FactMythList({Key? key}) : super(key: key);

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
                txtTitle: "Fact & Myth",
                navColor: AppColors.primary,
                bgColor: AppColors.greyLightest,
              ),
              ViewFactMyth(title: AppStrings.myth1,subTitle: AppStrings.fact1,),
              const SizedBox(
                height: 10,
              ),
              ViewFactMyth(title: AppStrings.myth2,subTitle: AppStrings.fact2,),
              const SizedBox(
                height: 10,
              ),
              ViewFactMyth(title: AppStrings.myth3,subTitle: AppStrings.fact3,),
              const SizedBox(
                height: 10,
              ),
              ViewFactMyth(title: AppStrings.myth4,subTitle: AppStrings.fact4,),
              const SizedBox(
                height: 10,
              ),
              ViewFactMyth(title: AppStrings.myth5,subTitle: AppStrings.fact5,),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
