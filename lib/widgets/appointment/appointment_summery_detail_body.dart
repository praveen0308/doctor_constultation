import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/widgets/schedule/temp_date.dart';
import 'package:doctor_consultation/widgets/template_ic_text1.dart';
import 'package:doctor_consultation/widgets/view_heading_appointment.dart';
import 'package:doctor_consultation/widgets/view_medicine_detail.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/widgets/view_text_cost.dart';
import 'package:doctor_consultation/widgets/timeline/view_timeline.dart';
import 'package:doctor_consultation/widgets/view_treatment_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateAppointmentBody extends StatelessWidget {
  const TemplateAppointmentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          // margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: AppColors.greyLightest,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight,
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.drName,
                        style: AppTextStyle.subtitle1(
                            txtColor: AppColors.greyDark),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppStrings.speciaList.toUpperCase(),
                        style: AppTextStyle.subtitle2(
                            txtColor: AppColors.greyBefore),
                      )
                    ],
                  ),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AppImages.drPriyanka))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TemplateDateTime(
                    imgURL: AppImages.icSchedulePrimary,
                    imgSize: 18,
                    dtColor: AppColors.greyBefore,
                    title: "01 Jan 2022".toUpperCase(),
                  ),
                  TemplateDateTime(
                    imgURL: AppImages.icTimingPrimary,
                    imgSize: 18,
                    dtColor: AppColors.greyBefore,
                    title: "09:30 AM".toUpperCase(),
                  ),
                  ViewInfoChip(
                    title: "Health issue",
                    bgColor: AppColors.successLightest,
                    txtColor: AppColors.successDark,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TemplateICText(
                txtTitle: "Clinic",
                txtSubTitle: AppStrings.clinicAddress,
                txtTColor: AppColors.greyBefore,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.imgMap),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryLight,
                        blurRadius: 5.0,
                      ),
                    ]),
              ),
              Divider(
                color: AppColors.grey,
                thickness: 1.5,
                height: 20,
              ),
              ViewHeadingAppointment(
                imgURL: AppImages.icPastAppointmentPrimary,
                txtTitle: "Case History",
                txtSubTitle: "hide history",
                sImg: 20,
                tColor: AppColors.greyBefore,
                sColor: AppColors.primary,
              ),
              const SizedBox(
                height: 10,
              ),
              ViewTimeline(),
              Divider(
                thickness: 1.5,
                color: AppColors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Treatment Cost",
                      style: AppTextStyle.subtitle1(
                          txtColor: AppColors.greyBefore,
                          wFont: FontWeight.w500),
                    ),
                    Text(
                      "₹300",
                      style: AppTextStyle.subtitle1(
                          txtColor: AppColors.greyBefore,
                          wFont: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.5,
                color: AppColors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Next Appoinment",
                      style: AppTextStyle.subtitle1(
                          txtColor: AppColors.greyBefore,
                          wFont: FontWeight.w500),
                    ),
                    Text(
                      "04 Janauary, 2022",
                      style: AppTextStyle.subtitle1(
                          txtColor: AppColors.greyBefore,
                          wFont: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BtnOutline(
                  title: "Cancel Appoinment",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
