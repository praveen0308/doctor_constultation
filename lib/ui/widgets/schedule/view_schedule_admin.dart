import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/view_my_from_to_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewScheduleAdmin extends StatelessWidget {
  final String imgUrl;
  final String txtTitle;
  final String txtSubTitle;

  final String txtTime1;
  final String txtTime2;

  final String txtCaption;

  final Color txtColor;
  final Color bgColor;

  final Function()? onMyTap;

  const ViewScheduleAdmin({
    Key? key,
    this.onMyTap,
    this.imgUrl = AppImages.imgAvatar,
    this.txtTitle = "Patient Name",
    this.txtSubTitle = "Routine",
    this.txtTime1 = "00:00 AM",
    this.txtTime2 = "00:30 AM",
    this.txtCaption = "Reason",
    this.txtColor = AppColors.successDark,
    this.bgColor = AppColors.successLightest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMyTap!(),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColors.greyLightest,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryLight,
                  blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
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
                            style: AppTextStyle.subtitle1(
                                txtColor: AppColors.greyDark),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            txtSubTitle,
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore,
                                wFont: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                AppImages.icArrowRight,
                                color: AppColors.greyLightest,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10 / 2 * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ViewMyFromToRichText(
                    text1: txtTime1.toUpperCase(),
                    text2: txtTime2.toUpperCase(),
                    txtStyle1: AppTextStyle.captionOF1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                    txtStyle2: AppTextStyle.captionOF1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                  ViewInfoChip(
                    title: txtCaption,
                    bgColor: bgColor,
                    txtColor: txtColor,
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
