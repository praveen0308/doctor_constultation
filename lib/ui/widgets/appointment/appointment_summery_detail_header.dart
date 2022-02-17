import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:flutter/cupertino.dart';

class TemplateAppointmentHeader extends StatelessWidget {
  const TemplateAppointmentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Appointment ID",
                    style: AppTextStyle.body1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                  Text(
                    "DS-TI52633",
                    style: AppTextStyle.subtitle1(
                        txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Treatment",
                    style: AppTextStyle.body1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                  Text(
                    "Health issue - Daily Checkup",
                    style: AppTextStyle.subtitle1(
                        txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: AppTextStyle.body1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                  ViewInfoChip(
                    title: "Approved".toUpperCase(),
                    bgColor: AppColors.successLightest,
                    txtColor: AppColors.successDark,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
