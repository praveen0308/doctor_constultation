import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';

class ViewMedicineSummery extends StatelessWidget {
  final String txtQty;
  final String txtMedicine;
  final String txtUnit;

  const ViewMedicineSummery({
    Key? key,
    this.txtQty = "0",
    this.txtMedicine = "Name",
    this.txtUnit = "00mg",
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
              txtQty,
              style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txtMedicine,
                  style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                ),
                // Text(
                //   txtSubTitle.toUpperCase(),
                //   style: AppTextStyle.subtitle1(
                //       txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                // ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txtUnit,
                  style: AppTextStyle.overlieOF1(
                      txtColor: AppColors.greyDark,
                      sFont: 18,
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
