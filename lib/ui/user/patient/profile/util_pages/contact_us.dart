import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/template_contact_us.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children:  [
              const AppBackNavBar(
                imgUrl: AppImages.icBackArrow,
                txtTitle: "Contact Us",
                navColor: AppColors.primary,
                bgColor: AppColors.greyLightest,
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // SvgPicture.asset(AppImages.imgWelcome),

                      ContactItemView(iconData: Icons.phone, title: "Mobile Number", description: AppStrings.drContactNo, onClick: () {
                        LauncherUtils.openPhone(AppStrings.drContactNo);
                      },),
                      ContactItemView(iconData: Icons.email, title: "Email", description: AppStrings.drEmail, onClick: () {
                        LauncherUtils.openEmail(AppStrings.drEmail, "Contact", "For Appointment");
                      },),
                      ContactItemView(iconData: Icons.language, title: "Website", description: AppStrings.webUrl, onClick: () {
                        LauncherUtils.openWebsite(AppStrings.webUrl);
                      },),
                      ContactItemView(iconData: Icons.location_on, title: "Address", description: AppStrings.officeAddress, onClick: () {
                        LauncherUtils.openMap(AppStrings.officeAddress);
                      },),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactItemView extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;
  final Function() onClick;

  const ContactItemView({Key? key, required this.iconData, required this.title, required this.description, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.primaryLight)
        ),
        child: Column(

            children: [
              Icon(iconData,size: 48,color: AppColors.primary,),
            Text(title,style: AppTextStyle.headline6(),),
            const SizedBox(height: 8,),
            Text(description,textAlign: TextAlign.center,style: AppTextStyle.captionRF1(txtColor: AppColors.grey),)],


        ),
      ),
    );
  }
}

