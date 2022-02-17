import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';

class ViewTextCost extends StatelessWidget {
  final String txtTitle;
  final String txtCost;

  const ViewTextCost({
    Key? key,
    this.txtTitle = "Title",
    this.txtCost = "Cost",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txtTitle,style: AppTextStyle.captionRF1(txtColor: AppColors.greyDark,wFont: FontWeight.w500),),
        Text(txtCost,style: AppTextStyle.captionRF1(txtColor: AppColors.greyDark,wFont: FontWeight.w500),),
      ],
    );
  }
}
