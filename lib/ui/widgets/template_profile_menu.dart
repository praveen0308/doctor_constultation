import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateProfileMenu extends StatefulWidget {
  final String imgURL;
  final String title;
  final Color tColor;

  final Function()? tabPressed;

  const TemplateProfileMenu({
    Key? key,
    this.imgURL = AppImages.icUserProfile,
    this.title = "Title",
    this.tColor = AppColors.greyDark,
    this.tabPressed,
  }) : super(key: key);

  @override
  State<TemplateProfileMenu> createState() => _TemplateProfileMenuState();
}

class _TemplateProfileMenuState extends State<TemplateProfileMenu> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.tabPressed,
          child: Row(
            children: [

              SizedBox(
                  height: 40,
                  child: SvgPicture.asset(
                    widget.imgURL,
                    color: widget.tColor,
                    width: 24,
                    height: 24,
                  )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 7,
                  child: Text(
                    widget.title,
                    style: AppTextStyle.subtitle1(
                        txtColor: widget.tColor, wFont: FontWeight.w400),
                  )),
              // Expanded(
              //   child: SvgPicture.asset(AppImages.icArrowRight,
              //       color: widget.tColor, height: 15),
              // ),
            ],
          ),
        ),
        Divider(
          color: AppColors.greyLight,
          thickness: 1,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
