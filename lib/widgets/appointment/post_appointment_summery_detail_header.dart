import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/widgets/template_ic_text1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplatePastAppointmentSummeryHeaderDetail extends StatelessWidget {

  const TemplatePastAppointmentSummeryHeaderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 20),
        decoration: BoxDecoration(
            color: AppColors.greyLightest,
            boxShadow: const [
              BoxShadow(
                color: AppColors.primaryLight,
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const CircleAvatar(
        radius: 30,
          backgroundImage: AssetImage(AppImages.imgAvatar),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aakash Yadav",
                style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Daily Checkup",
                style:
                AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
              ),
            ],
          ),
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Video Call",
              style: AppTextStyle.captionRF2(txtColor: AppColors.greyDark),
            ),
            const SizedBox(
              height: 5,
            ),
            const ViewInfoChip(
              title: "Health issue",
              bgColor: AppColors.successLightest,
              txtColor: AppColors.successDark,
            )
          ],
        )
        ],
        ),
        Divider(color: AppColors.grey, indent: 3, thickness: 1.3,),
        const SizedBox(
        height: 5,
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          TemplateICText(
            imgURL: AppImages.icClinicPrimary,
            txtTitle: "Clinic",
            txtSubTitle: AppStrings.clinicAddress,
            txtTColor: AppColors.greyBefore,
            txtSTColor: AppColors.greyDark,
          ),
          TemplateICText(
            imgURL: AppImages.icPhoneCallPrimary,
            txtTitle: "Contact",
            txtSubTitle: "8976210521",
            txtTColor: AppColors.greyBefore,
            txtSTColor: AppColors.greyDark,
          ),
        ],
        ),
        Divider(color: AppColors.grey, indent: 3, thickness: 1.3,),
        const SizedBox(
        height: 10,
        ),
        Column(
        children: [
        Text("How was the doctor’s service?", style: AppTextStyle.body1(
          txtColor: AppColors.greyDark, wFont: FontWeight.w700),),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar(
            initialRating: 4.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 24,
            ratingWidget: RatingWidget(
              full: SvgPicture.asset(AppImages.icStarFill,color: AppColors.primary,),
              half: SvgPicture.asset(AppImages.icStarHalf,color: AppColors.primary,),
              empty: SvgPicture.asset(AppImages.icStarEmpty,color: AppColors.primary,),
            ),
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text("4.6",style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),)
        ],
        ),
        ],
      )
      ],
    )
    ,
    )
    ,
    );
  }
}
