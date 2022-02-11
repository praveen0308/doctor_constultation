import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppBackFilterNavBar extends StatelessWidget {
  final String imgUrl1;
  final String imgUrl2;
  final String txtTitle;
  final Color navColor;
  final Color bgColor;

  const AppBackFilterNavBar(
      {Key? key,
      this.imgUrl1 = "",
      this.imgUrl2 = "",
      this.txtTitle = "",
      this.navColor = AppColors.primary,
      this.bgColor = AppColors.greyLightest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: SvgPicture.asset(imgUrl1, color: navColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            txtTitle,
          style: AppTextStyle.headline6(txtColor: navColor),
          ),

          const Spacer(
            flex: 6,
          ),
          IconButton(
            icon: SvgPicture.asset(imgUrl2), onPressed: () {},
          ),
        ],
      ),

    );
  }
}
