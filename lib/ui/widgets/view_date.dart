import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewDateContent extends StatefulWidget {
  final String title;
  final String subTitle;
  final String caption;
  final Color mainColor;
  final Color outerColor;
  final Color innerColor;

  const ViewDateContent({
    Key? key,
    this.title = "",
    this.subTitle = "",
    this.caption = "",
    this.mainColor = AppColors.primary,
    this.innerColor = AppColors.primary,
    this.outerColor = AppColors.primaryLightest,
  }) : super(key: key);

  @override
  State<ViewDateContent> createState() => _ViewDateContentState();
}

class _ViewDateContentState extends State<ViewDateContent> {
  bool _selectDate = false;
  @override
  Widget build(BuildContext context) {
    double sHeight = 70;
    double sWidth = sHeight - 10;
    return Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              _selectDate = !_selectDate;
            });
          },
          child: Container(
            height: sHeight,
            width: sWidth,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: _selectDate?widget.mainColor:AppColors.greyLightest,
              borderRadius: BorderRadius.circular(5),
                border: Border.all(color: _selectDate? widget.outerColor:AppColors.greyLight)
            ),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: AppTextStyle.overlieRF1(txtColor: _selectDate? widget.outerColor:AppColors.greyLight ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: sHeight - 40,
                      width: sHeight - 40,
                      decoration: BoxDecoration(
                          color: _selectDate? widget.outerColor:AppColors.greyLight, borderRadius: BorderRadius.circular(20)),
                    ),
                    Text(
                      widget.subTitle,
                      style: AppTextStyle.captionRF2(txtColor: _selectDate? widget.innerColor:AppColors.greyBefore ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(widget.caption,style: AppTextStyle.captionRF2(txtColor: AppColors.grey),)
      ],
    );
  }
}
