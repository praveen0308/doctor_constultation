import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';

class TemplateStatus extends StatelessWidget {
  final Color sColor;
  final double sSize;
  final String title;
  const TemplateStatus({Key? key,
  this.title = "",
  this.sColor = AppColors.success,
  this.sSize = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: sSize,
          width: sSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: sColor
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(title, style: AppTextStyle.overlieRF1(txtColor: AppColors.greyBefore),)

      ],
    );
  }
}
