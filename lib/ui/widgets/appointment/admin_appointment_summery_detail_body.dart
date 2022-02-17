import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/schedule/template_admin_time_with_schedule.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateAdminAppointmentBody extends StatelessWidget {
  const TemplateAdminAppointmentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(top: 5.0,bottom: 20),
            child: ViewMyRichText(
              text1: "Appointment",
              text2: "(10)",
              txtStyle1: AppTextStyle.captionRF1(
                  txtColor: AppColors.greyDark, wFont: FontWeight.w500),
              txtStyle2: AppTextStyle.captionRF1(
                  txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
            ),
          ),
          TemplateAdminTimeSchedule(
            txtMainTime: "09:00 am",
            txtFrom: "09:00 am",
            txtTo: "09:30 am",
            txtTitle: "Mr. Sunil Yadav",
            txtSubTitle: "Daily checkup",
            txtCaption: "Cold Fever",
            txtColor: AppColors.errorDark,
            bgColor: AppColors.errorLightest,
          ),
          TemplateAdminTimeSchedule(
            txtMainTime: "09:30 am",
            txtFrom: "09:30 am",
            txtTo: "10:00 am",
            txtTitle: "Mr. Santosh Yadav",
            txtSubTitle: "Save as Web",
            txtCaption: "Meeting",
            txtColor: AppColors.warning,
            bgColor: AppColors.warningLightest,
          ),
          TemplateAdminTimeSchedule(
            txtMainTime: "10:00 am",
            txtFrom: "10:00 am",
            txtTo: "10:30 am",
            txtTitle: "Mr. Praveen Yadav",
            txtSubTitle: "Daily checkup",
            txtCaption: "Health issue",
            txtColor: AppColors.successDark,
            bgColor: AppColors.successLightest,
          ),
          TemplateAdminTimeSchedule(
            txtMainTime: "10:30 am",
            txtFrom: "10:30 am",
            txtTo: "11:00 am",
            txtTitle: "Mr. Devesh Yadav",
            txtSubTitle: "Weekly checkup",
            txtCaption: "Health Report",
            txtColor: AppColors.primary,
            bgColor: AppColors.primaryLightest,
          ),
        ],
      ),
    );
  }
}