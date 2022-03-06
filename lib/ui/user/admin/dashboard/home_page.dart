import 'package:doctor_consultation/models/action_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/admin_today_task.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_circle.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/patient/alpha_patient.dart';
import 'package:doctor_consultation/ui/widgets/patient/next_patient.dart';
import 'package:doctor_consultation/ui/widgets/quick_action_item.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  final List<ActionModel> quickActions = AppConstants.getQuickActions();
  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    //#region ##### Good wishes #######

    //#endregion
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          AppNavBar(
            txtAddress: "Marine Line, Mumbai",
          ),
          Text(DateTimeHelper.getGreeting(),
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
          SizedBox(
            height: 120,
            child: ListView.builder(shrinkWrap:true,physics: ClampingScrollPhysics(),scrollDirection: Axis.horizontal,itemCount: quickActions.length,itemBuilder: (_,index){
              return QuickActionItem(actionModel: quickActions[index], onClick: (action){
              navigateQuickActions(action);
              });
            }),
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
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ViewMyRichText(
                text1: "Next",
                text2: " Patient",
                txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                txtStyle2:
                    AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
              ),

            ],
          ),
          TemplateNextPatient(),*/

          const SizedBox(
            height: 16,
          ),
          /*BtnFilled(
            title: "View Schedule",
            onBtnPressed: () {
              Navigator.pushNamed(context, "/viewSchedule");
            },
          ),*/
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  void navigateQuickActions(AppNavActions action){
    switch(action){

      case AppNavActions.viewSchedule:
        Navigator.pushNamed(context, "/viewSchedule");
        break;
      case AppNavActions.uploadVideo:
        Navigator.pushNamed(context, "/uploadVideo");
        break;
    }
  }
}
