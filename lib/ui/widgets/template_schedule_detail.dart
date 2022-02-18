import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_date.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_status.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateScheduleDetail extends StatelessWidget {
  const TemplateScheduleDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
    child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            decoration: BoxDecoration(
                color: AppColors.greyLightest,
                boxShadow: const [BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 5.0,
                ),],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.drName, style: AppTextStyle.headline6()),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppStrings.speciaList.toUpperCase(),
                  style: AppTextStyle.body3(txtColor: AppColors.greyBefore),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TemplateICText(
                  imgURL: AppImages.icClinicPrimary,
                  txtTitle: "Address",
                  txtSubTitle: AppStrings.clinicAddress,
                  txtCaption: AppStrings.clinicPlace,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.grey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TemplateDateTime(
                        imgURL: AppImages.icSchedulePrimary,
                        imgSize: 18,
                        dtColor: AppColors.greyBefore,
                        title: "03 Jan 2022".toUpperCase()),
                    TemplateDateTime(
                        imgURL: AppImages.icTimingPrimary,
                        imgSize: 18,
                        dtColor: AppColors.greyBefore,
                        title: "09:30 am".toUpperCase()),
                    const TemplateStatus(
                      title: "Rejected",
                      sColor: AppColors.error,
                      sSize: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 130,
                      child: BtnOutline(title: "Cancel"),
                    ),
                    SizedBox(
                      width: 130,
                      child: BtnFilled(
                        title: "Reschedule",
                        onBtnPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}