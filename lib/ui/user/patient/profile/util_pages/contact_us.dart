import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children:  [
              const AppBackNavBar(
                imgUrl: AppImages.icBackArrow,
                txtTitle: "Contact Us",
                navColor: AppColors.primary,
                bgColor: AppColors.greyLightest,
              ),
              Column(
                children: [
                  Text("Dr. Priyanka Yaduvanshi visits all the prominent cities in \n India and abroad.",textAlign: TextAlign.center,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
