import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/user/admin/appointment/patient_past_appointment_detail.dart';
import 'package:doctor_consultation/widgets/btn/info_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplatePostAppointmentSummery extends StatelessWidget {
  const TemplatePostAppointmentSummery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientPastAppointmentDetailPage())),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.greyLightest,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryLight,
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "View Previous Result",
                        style: AppTextStyle.subtitle2(
                          txtColor: AppColors.primary,
                        ),
                      ),
                    )
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
                  ViewInfoChip(
                    title: "Health issue",
                    bgColor: AppColors.successLightest,
                    txtColor: AppColors.successDark,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
