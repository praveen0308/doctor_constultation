import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip_with_icon.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateChatWithPatient extends StatelessWidget {
  final String txtTitle;
  final String txtSubTitle;
  final String txtAmt;
  final String txtType;

  final String txtIcon;
  final Color cType;
  final Color bgType;
  final Function()? onTab;

  const TemplateChatWithPatient({
    Key? key,
    this.txtTitle = "Title",
    this.txtSubTitle = "SubTitle",
    this.txtAmt = "Amt",
    this.txtType = "Type",
    this.cType = AppColors.primary,
    this.bgType = AppColors.primaryLightest,
    this.onTab,
    this.txtIcon = AppImages.icMessage,
  }) : super(key: key);

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
                        txtTitle,
                        style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        txtSubTitle,
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
                      txtAmt,
                      style: AppTextStyle.subtitle1(
                          txtColor: AppColors.greyDark, wFont: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ViewInfoChipWithIcon(
                      title: txtType,
                      bgColor: bgType,
                      txtColor: cType,
                      imgUrl: txtIcon,
                      onMyTab: () => onTab!(),
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: AppColors.grey,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TemplateDateTime(
                  imgURL: AppImages.icSchedulePrimary,
                  title: "01 Jan 2022".toUpperCase(),
                ),
                TemplateDateTime(
                  imgURL: AppImages.icTimingPrimary,
                  title: "09:30 am".toUpperCase(),
                ),
                Text("Health Issue",style: AppTextStyle.captionRF2(txtColor: AppColors.primary),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
