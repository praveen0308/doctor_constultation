import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/material.dart';

class EmptyDataContainer extends StatelessWidget {
  final String msg;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  const EmptyDataContainer(
      {Key? key,
      required this.msg,
      this.bgColor = AppColors.primaryLightest,
      this.borderColor = AppColors.primaryDark,
      this.textColor = AppColors.primaryDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          msg,
          style: AppTextStyle.headline6(txtColor: textColor),
        ),
      ),
    );
  }
}
