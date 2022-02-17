import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppBackNavBar extends StatelessWidget {
  final String imgUrl;
  final String txtTitle;
  final Color navColor;
  final Color bgColor;
  const AppBackNavBar({Key? key,this.imgUrl = AppImages.icBackArrow,this.txtTitle = "",this.navColor = AppColors.primary,this.bgColor = AppColors.greyLightest}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      leading: IconButton(
        icon: SvgPicture.asset(imgUrl,color: navColor),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(txtTitle,style: AppTextStyle.headline6(txtColor: navColor),)
    );
  }
}
