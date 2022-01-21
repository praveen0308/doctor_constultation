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
        backgroundColor: AppColors.primaryLight,
        leading: IconButton(
          // icon: Image.asset(AppImages.drPriyanka,),
          // onPressed: () { },
          icon: const CircleAvatar(
            backgroundImage: AssetImage(AppImages.drPriyanka),
          ),
          onPressed: (){},
        ),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            SizedBox(
              child: SvgPicture.asset(AppImages.icLocationPrimary),
              height: 20,
              width: 11,
            ),
            const Text("Jari Mari, Sakinaka",style: TextStyle(
              color: AppColors.greyDark
            ),),
            SizedBox(
              child: SvgPicture.asset(AppImages.icArrowDown),
              height: 15,
              width: 10,
            ),
            SizedBox(
              child: SvgPicture.asset(AppImages.icNotificationPrimary),
              height: 24,
              width: 10,
            ),

          ],
        ),);

  }
}
