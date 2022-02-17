import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/about_us.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/contact_us.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/help_us.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/share_us.dart';
import 'package:doctor_consultation/widgets/template_profile_menu.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'account_pages/my_addresses.dart';
import 'account_pages/my_booking.dart';
import 'account_pages/my_plan.dart';
import 'account_pages/personl_data.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Column(
        children: [
          // Text(
          //   "Account",
          //   style: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
          // ),
          const SizedBox(
            height: 10,
          ),
          TemplateProfileMenu(
              imgURL: AppImages.icUserProfile,
              title: "Personal Data",
              tabPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonalData()))),
          TemplateProfileMenu(
              imgURL: AppImages.icSchedule,
              title: "My Bookings",
              tabPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyBooking()))),
          TemplateProfileMenu(
              imgURL: AppImages.icMyPlan,
              title: "My Plan",
              tabPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyPlan()))),
          TemplateProfileMenu(
              imgURL: AppImages.icAddresses,
              title: "My Addresses",
              tabPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAddresses()))),
          // const SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   "Utils",
          //   style: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          TemplateProfileMenu(
              imgURL: AppImages.icAboutUs,
              title: "About Us",
              tabPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()))),
          TemplateProfileMenu(
              imgURL: AppImages.icVoiceCall,
              title: "Contact Us",
              tabPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()))),
          TemplateProfileMenu(
              imgURL: AppImages.icHelpUs,
              title: "Help Us",
              tabPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpUs()))),
          TemplateProfileMenu(
              imgURL: AppImages.icShareUs,
              title: "Share Us",
              tabPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ShareUs()))),
          TemplateProfileMenu(
            imgURL: AppImages.icLogOut,
            title: "Logout",
            tabPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Follow us",
            style: AppTextStyle.subtitle1(
                txtColor: AppColors.greyDark, wFont: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(
                    AppImages.imgInstagram,
                    height: 24,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(
                    AppImages.imgFacebook,
                    height: 24,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(
                    AppImages.imgWhatsApp,
                    height: 24,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(
                    AppImages.imgLinkedin,
                    height: 24,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(
                    AppImages.imgTwitter,
                    height: 24,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(
                    AppImages.imgYouTube,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ViewMyRichText(
            text1: "Version",
            text2: "1.0.0.1",
          )
        ],
      ),
    );
  }
}
