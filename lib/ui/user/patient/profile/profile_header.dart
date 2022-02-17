import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../manage_payment.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Profile",
            style: AppTextStyle.headline6(
                txtColor: AppColors.greyDark, wFont: FontWeight.w500),
          ),
        ),
        Row(
          children: [
            // SvgPicture.asset(AppImages.icBackArrow,color: AppColors.primary,),
            // const SizedBox(
            //   width: 10,
            // ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AppImages.imgAvatar),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sunil Yadav",
                  style: AppTextStyle.headline6(txtColor: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 5,
                ),
                ViewMyRichText(
                  text1: "ID",
                  text2: "DJM10001",
                ),
              ],
            )
            // const SizedBox(
            //   width: 100,
            // ),
            // Text("v1.0.1",style: AppTextStyle.captionRF2(txtColor: AppColors.greyBefore),),
          ],
        ),
        // Divider(
        //   thickness: 2.0,
        //   color: AppColors.grey,
        // )
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            color: AppColors.primaryLightest,
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Account",
                style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("₹0.00",style: AppTextStyle.subtitle1(txtColor: AppColors.greyDarkest),),
                  ViewInfoChip(
                    title: "Manage",
                    bgColor: AppColors.primary,
                    txtColor: AppColors.greyLightest,
                    onClick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutManagePayment())),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
