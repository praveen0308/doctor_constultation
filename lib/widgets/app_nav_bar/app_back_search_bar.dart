import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppBackSearchNavBar extends StatelessWidget {
  final String imgUrl;
  final String txtTitle;
  final Color navColor;
  final Color bgColor;

  const AppBackSearchNavBar(
      {Key? key,
      this.imgUrl = AppImages.icBackArrow,
      this.txtTitle = "",
      this.navColor = AppColors.primary,
      this.bgColor = AppColors.greyLightest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      titleSpacing: 0,
      leading: IconButton(
        icon: SvgPicture.asset(imgUrl, color: navColor),
        onPressed: () => Navigator.pop(context),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(AppImages.icSearchPrimary,height: 22),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(AppImages.icFilterPrimary,height: 15),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search Patients...',
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
