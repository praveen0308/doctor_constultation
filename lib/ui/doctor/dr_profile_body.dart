import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/achievement_model.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/patient_review.dart';
import 'package:doctor_consultation/ui/widgets/template_achievement.dart';
import 'package:doctor_consultation/ui/widgets/template_contact_us.dart';
import 'package:doctor_consultation/ui/widgets/timeline/view_timeline2.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class DrProfileBody extends StatefulWidget {
  const DrProfileBody({Key? key}) : super(key: key);

  @override
  _DrProfileBodyState createState() => _DrProfileBodyState();
}

class _DrProfileBodyState extends State<DrProfileBody> {
  List<AchievementModel> achievements = [];
  final _storage = SecureStorage();

  @override
  void initState() {
    populateAchievements();
    super.initState();
  }

  void populateAchievements() {
    achievements.add(AchievementModel(AppImages.icPatientCount,
        AppColors.primaryLightest, AppColors.primary, "6L+", "Patient"));
    achievements.add(AchievementModel(AppImages.icExperienceCount,
        AppColors.errorLightest, AppColors.error, "20+ Yrs", "Experience"));
    achievements.add(AchievementModel(AppImages.icStarEmpty,
        AppColors.warningLightest, AppColors.warning, "4.5+", "Rating"));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Achievements",
            style: AppTextStyle.subtitle1(),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 140,
            //ListView
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 30,
              ),
              itemCount: achievements.length,
              itemBuilder: (BuildContext context, int index) {
                var model = achievements[index];
                return TemplateAchievement(
                  iconImage: model.imgUrl,
                  iconColor: model.iconColor,
                  bgColor: model.bgColor,
                  txtTitle: model.title,
                  txtSubtitle: model.subtitle,
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "About Us",
            style: AppTextStyle.subtitle1(),
          ),
          const SizedBox(
            height: 10,
          ),
          ExpandableText(
            "I have been practising Homeopathy for the last 15 years and the experience of it's wonder play and the efficacy of this infallible science brings deep satisfaction to me. When I hear from my clients their happy exposure to Homeopathic treatment and seeing the delightful smile on their faces, it makes my day. I am also thankful to my teachers for imparting such valuable knowledge and experience to me which they gained practising their entire life. Also Homoeopathic opinion is must when any disease does not respond to other modalities of treatments,ICU cases, accidents and emergencies.",
            style: AppTextStyle.body1(),
            expandText: 'Read more',
            collapseText: 'Read less',
            maxLines: 3,
            linkColor: AppColors.primary,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Education",
            style: AppTextStyle.subtitle1(),
          ),
          const SizedBox(
            height: 10,
          ),
          ViewTimelineEducation(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Contact Us",
            style: AppTextStyle.subtitle1(),
          ),
          const SizedBox(
            height: 15,
          ),
          const TemplateContactUs(),
          const SizedBox(
            height: 20,
          ),
          LayoutPatientReview(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: BtnFilled(
              title: "Book an Appointment",
              onBtnPressed: () async {
                var isLoggedIn = await _storage.getLoginStatus();
                if (isLoggedIn) {
                  Navigator.pushNamed(context, route.newAppointment);
                } else {
                  Navigator.pushNamed(context, route.login);
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void bookNewAppointment() {
    var roleId = _storage.getUserRoleId();
  }
}
