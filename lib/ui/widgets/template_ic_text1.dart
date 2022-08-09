import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateICText extends StatelessWidget {
  final String imgURL;
  final String txtTitle;
  final String txtSubTitle;
  final String txtCaption;
  final Color txtTColor;
  final Color txtSTColor;
  final Color txtCapColor;
  final double iSize;

  const TemplateICText({
    Key? key,
    this.imgURL = AppImages.icClinicPrimary,
    this.txtTitle = "",
    this.txtSubTitle = "",
    this.txtCaption = "",
    this.txtTColor = AppColors.greyDark,
    this.txtSTColor = AppColors.greyDark,
    this.txtCapColor = AppColors.greyBefore,
    this.iSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          imgURL,
          height: iSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              txtTitle,
              style: AppTextStyle.body1(txtColor: txtTColor,wFont: FontWeight.w500),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(txtSubTitle, style: AppTextStyle.subtitle2(txtColor: txtSTColor)),
            Text(
              txtCaption.toUpperCase(),
              style: AppTextStyle.body2(txtColor: txtCapColor),
            ),
          ],
        )
      ],
    );
  }
}
