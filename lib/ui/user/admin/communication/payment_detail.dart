import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutPaymentConfirmation extends StatelessWidget {
  const LayoutPaymentConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              AppBackNavBar(
                txtTitle: "Payment",
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
