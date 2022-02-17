import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/view_small_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateNextPatient extends StatelessWidget {
  const TemplateNextPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: MediaQuery.of(context).size.width,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                        style:
                            AppTextStyle.subtitle1(txtColor: AppColors.primary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Health Checkup",
                        style: AppTextStyle.captionRF1(
                            txtColor: AppColors.greyBefore),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Patient ID",
                        style: AppTextStyle.captionRF2(
                            txtColor: AppColors.greyDark),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "TDC-52112269996",
                        style: AppTextStyle.captionRF3(
                            txtColor: AppColors.greyBefore),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ViewSmallDetail(
                      title: "D. O. B.",
                      subTitle: "10 January 2022",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ViewSmallDetail(
                      title: "Last Appointment",
                      subTitle: "01 January 2022",
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ViewSmallDetail(
                      title: "Sex",
                      subTitle: "Male",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ViewSmallDetail(
                      title: "Reg. Date",
                      subTitle: "26 December 2021",
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ViewSmallDetail(
                      title: "Weight",
                      subTitle: "62 kg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ViewSmallDetail(
                      title: "Height",
                      subTitle: "162 CM",
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Patient History",
                  style: AppTextStyle.body1(txtColor: AppColors.primary,wFont: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: <Widget>[
                ViewInfoChip(title: "Report",bgColor: AppColors.primaryLightest,txtColor: AppColors.primary,),
                ViewInfoChip(title: "Fever",bgColor: AppColors.errorLightest,txtColor: AppColors.error,),
                ViewInfoChip(title: "Report",bgColor: AppColors.primaryLightest,txtColor: AppColors.primary,),
                ViewInfoChip(title: "Report",bgColor: AppColors.primaryLightest,txtColor: AppColors.primary,),
                ViewInfoChip(title: "Report",bgColor: AppColors.primaryLightest,txtColor: AppColors.primary,),

                  ]),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Last Prescriptions",
                  style: AppTextStyle.body1(txtColor: AppColors.primary,wFont: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
