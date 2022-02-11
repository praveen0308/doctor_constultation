import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/user/patient/dashboard/youtube/youtube_video.dart';
import 'package:doctor_consultation/widgets/admin_today_task.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/widgets/btn/btn_circle.dart';
import 'package:doctor_consultation/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/widgets/fact_myth.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/widgets/patient/alpha_patient.dart';
import 'package:doctor_consultation/widgets/patient/next_patient.dart';
import 'package:doctor_consultation/widgets/patient_review.dart';
import 'package:doctor_consultation/widgets/schedule/view_schedule_admin.dart';
import 'package:doctor_consultation/widgets/template_achievement.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    //#region ##### Good wishes #######
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 12) {
      message = 'Good Morning 🌞';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afternoon 🌤';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'Good Evening 🌜';
    } else {
      message = 'Good Night 🌛';
    }
    //#endregion
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          AppNavBar(
            txtAddress: "Marine Line, Mumbai",
          ),
          Text(message,
              style: (AppTextStyle.subtitle1(
                  txtColor: AppColors.primary, wFont: FontWeight.w500))),
          const SizedBox(
            height: 5,
          ),
          ViewMyRichText(
            text1: AppStrings.drFName,
            txtStyle1: AppTextStyle.headline5(txtColor: AppColors.greyDark),
            text2: AppStrings.drLName,
            txtStyle2: AppTextStyle.headline5(txtColor: AppColors.greyBefore),
          ),
          const SizedBox(
            height: 5,
          ),
              ViewSearchPatientFilter(),
          const SizedBox(
            height: 5,
          ),
          ViewTodayTask(),
          const SizedBox(
            height: 5,
          ),
          ViewMyRichText(
            text1: "Quick",
            text2: " Action",
            txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
            txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Column(
                children: [
                  BtnCircle(
                    tabPressed: () {},
                    iconImage: AppImages.icSchedule,
                    iconColor: AppColors.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Request",
                      style: AppTextStyle.captionRF3(
                          txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  BtnCircle(
                    tabPressed: () {},
                    iconImage: AppImages.icSchedule,
                    iconColor: AppColors.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Request",
                      style: AppTextStyle.captionRF3(
                          txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ViewMyRichText(
                text1: "Today’s",
                text2: " Patients",
                txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                txtStyle2:
                    AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
              ),
              GestureDetector(
                onTap: () {},
                //=>Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubeList()))
                child: Text(
                  "View all",
                  style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
                ),
              ),
            ],
          ),
          TemplateAlphaPatient(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ViewMyRichText(
                text1: "Next",
                text2: " Patient",
                txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                txtStyle2:
                    AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
              ),
              // GestureDetector(
              //   onTap: () {}, //=>Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubeList()))
              //   child: Text(
              //     "View all",
              //     style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
              //   ),
              // ),
            ],
          ),
          TemplateNextPatient()
        ],
      ),
    );
  }
}
