import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.greyLight,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          // icon: Image.asset(AppImages.drPriyanka,),
          // onPressed: () { },

          icon: const CircleAvatar(
            backgroundImage: AssetImage(AppImages.drPriyanka),
          ),
          onPressed: () {},
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Spacer(
            flex: 4,
          ),
          SizedBox(
            child: SvgPicture.asset(AppImages.icLocationPrimary),
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "Jari Mari, Sakinaka",
            style: TextStyle(color: AppColors.greyDark, fontSize: 16),
          ),
          const SizedBox(
            width: 4,
          ),
          SizedBox(
            child: SvgPicture.asset(AppImages.icArrowDown),
            height: 15,
            width: 10,
          ),
          const Spacer(
            flex: 6,
          ),
          SizedBox(
            child: SvgPicture.asset(AppImages.icNotificationPrimary),
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}
