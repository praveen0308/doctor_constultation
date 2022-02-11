
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../doctor/dr_profile.dart';
import '../../res/app_colors.dart';
import '../../res/image_path.dart';
import '../../user/patient/communication/video_call/main_video_call.dart';
import '../../user/patient/communication/voice_call/main_voice_call.dart';

class AppChatNavBar extends StatelessWidget {
  const AppChatNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: AppColors.greyLightest,
      padding: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: SvgPicture.asset(AppImages.icBackArrow,
                color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage(AppImages.drPriyanka),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DrProfilePage(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.drName,
                style: AppTextStyle.body1(txtColor: AppColors.greyDark),
              ),
              Text(
                AppStrings.speciaList,
                style: AppTextStyle.overlieRF2(txtColor: AppColors.greyDark),
              ),
            ],
          ),
          IconButton(
              icon: SvgPicture.asset(
                AppImages.icVoiceCall,
                color: AppColors.primary,
                height: 20,
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainVoiceCall()))),
          IconButton(
              icon: SvgPicture.asset(
                AppImages.icUnMuteVideoCall,
                color: AppColors.primary,
                height: 15,
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainVideoCall()))),
        ],
      ),
    );
  }
}
