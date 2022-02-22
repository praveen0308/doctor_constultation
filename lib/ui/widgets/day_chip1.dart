import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayChip1 extends StatefulWidget {
  final String title;
  final String subTitle;
  final String caption;
  final Color mainColor;
  final Color outerColor;
  final Color innerColor;
  final Function() onClick;
  final bool isSelected;

  const DayChip1({
    Key? key,
    this.title = "",
    this.subTitle = "",
    this.caption = "",
    this.mainColor = AppColors.primary,
    this.innerColor = AppColors.primary,
    this.outerColor = AppColors.primaryLightest,
    required this.onClick,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<DayChip1> createState() => _DayChip1State();
}

class _DayChip1State extends State<DayChip1> {
  @override
  Widget build(BuildContext context) {
    double sHeight = 60;
    double sWidth = sHeight - 8;
    return Column(
      children: [
        InkWell(
          onTap: () {
            widget.onClick();
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              width: sWidth,
              height: sHeight / 2 * 2 - 10,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: widget.isSelected
                      ? widget.mainColor
                      : AppColors.greyLightest,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: widget.isSelected
                          ? widget.outerColor
                          : AppColors.primary)),
              child: Text(
                widget.title,
                style: AppTextStyle.body1(
                    wFont: FontWeight.w500,
                    txtColor: widget.isSelected
                        ? widget.outerColor
                        : AppColors.primary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.caption,
          style: AppTextStyle.captionRF2(txtColor: AppColors.grey),
        ),
      ],
    );
  }
}
