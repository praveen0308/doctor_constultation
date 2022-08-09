import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About Us"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.drPriyanka),
                  radius: 100,
                ),
                SizedBox(height: 16,),
                Text(AppConstants.doctorName,textAlign:TextAlign.center,style: AppTextStyle.headline5(txtColor:
                AppColors.primary),),
                SizedBox(height: 24,),
                Text(AppConstants.aboutDoctor,textAlign:TextAlign.justify,style: TextStyle(fontSize: 18,letterSpacing: 0.5,wordSpacing: 1),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
