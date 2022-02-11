import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';

class ViewInfoChip extends StatelessWidget {
  final Color bgColor;
  final Color txtColor;
  final String title;
  final Function()? onClick;

  const ViewInfoChip({
    Key? key,
    this.bgColor = AppColors.primaryLight,
    this.txtColor = AppColors.primaryDark,
    this.title = "Title",
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: GestureDetector(
        onTap:() => onClick!(),
        child: Container(
          alignment: AlignmentDirectional.center,
          height: 25,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
              title,
              style: AppTextStyle.captionRF2(
                txtColor: txtColor,
              )),
        ),
      ),
    );
  }
}
