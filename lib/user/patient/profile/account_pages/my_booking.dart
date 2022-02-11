import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyBooking extends StatelessWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AppBackNavBar(
              imgUrl: AppImages.icBackArrow,
              txtTitle: "My Bookings",
              navColor: AppColors.primary,
              bgColor: AppColors.greyLightest,
            )
          ],
        ),
      ),
    );
  }
}
