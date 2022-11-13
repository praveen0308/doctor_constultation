import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateAlphaPatient extends StatelessWidget {
  final String name;
  final String subtitle;
  final String age;
  final String gender;
  final String picUrl;

  const TemplateAlphaPatient(
      {Key? key,
      required this.name,
      required this.subtitle,
      required this.age,
      required this.gender,
      this.picUrl = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
          children: [
            picUrl.isEmpty
                ? const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AppImages.imgAvatar),
                  )
                : CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(picUrl),
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
                    name,
                    style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
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
                  age,
                  style: AppTextStyle.captionRF2(txtColor: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 5,
                ),
                ViewInfoChip(
                  title: gender,
                  bgColor: AppColors.successLightest,
                  txtColor: AppColors.successDark,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
