import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';

class ViewTreatmentTimeline extends StatelessWidget {
  final String txtSr;
  final String txtTitle;
  final String txtSubTitle;
  final String txtDate;
  final String txtTiming;

  const ViewTreatmentTimeline({
    Key? key,
    this.txtSr = "0",
    this.txtTitle = "Title",
    this.txtSubTitle = "SubTitle",
    this.txtDate = "Date",
    this.txtTiming = "00:00",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.primaryLightest),
        child: Row(
          children: [
            Text(
              txtSr,
              style: AppTextStyle.headline6(txtColor: AppColors.greyDark),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txtTitle,
                  style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark,wFont: FontWeight.w500),
                ),
                Text(
                  txtSubTitle.toUpperCase(),
                  style: AppTextStyle.subtitle2(
                      txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txtDate,
                  style: AppTextStyle.subtitle1(
                      txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                ),
                Text(
                  txtTiming,
                  style: AppTextStyle.overlieOF2(
                      txtColor: AppColors.greyDark,
                      sFont: 16,
                      wFont: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
