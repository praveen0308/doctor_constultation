import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewDayAdminContent extends StatefulWidget {
  final String title;
  final String subTitle;
  final String caption;
  final Color mainColor;
  final Color outerColor;
  final Color innerColor;

  const ViewDayAdminContent({
    Key? key,
    this.title = "",
    this.subTitle = "",
    this.caption = "",
    this.mainColor = AppColors.primary,
    this.innerColor = AppColors.primary,
    this.outerColor = AppColors.primaryLightest,
  }) : super(key: key);

  @override
  State<ViewDayAdminContent> createState() => _ViewDateContentState();
}

class _ViewDateContentState extends State<ViewDayAdminContent> {
  bool _selectDate = false;

  @override
  Widget build(BuildContext context) {
    double sHeight = 60;
    double sWidth = sHeight - 8;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _selectDate = !_selectDate;
            });
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              width: sWidth,
              height: sHeight/2*2-10,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color:
                      _selectDate ? widget.mainColor : AppColors.greyLightest,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: _selectDate
                          ? widget.outerColor
                          : AppColors.primary)),
              child: Text(
                widget.title,
                style: AppTextStyle.body1(
                  wFont: FontWeight.w500,
                    txtColor: _selectDate
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
