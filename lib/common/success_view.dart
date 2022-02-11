import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/widgets/btn/btn_outline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0 / 4 * 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.imgSuccessfullyDone),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Thank you for Appoinment Booking!",
                style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '''You booked an appoinment with \n Dr. Priyanaka Yaduwanshi \n on 01 January, 2022 at 09:30 AM''',
                textAlign: TextAlign.center,
                style: AppTextStyle.overlieOF1(txtColor: AppColors.greyBefore),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.42,
                      child: BtnOutline(title: "Go to Home"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.42,
                      child:
                          BtnFilled(title: "Set reminder", onBtnPressed: () {}),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
