import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/about_us.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/contact_us.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/share_us.dart';
import 'package:doctor_consultation/ui/widgets/template_profile_menu.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class ProfileBody extends StatelessWidget {
  final _storage = SecureStorage();

  ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: SingleChildScrollView(
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
                tabPressed: () {
                  Navigator.pushNamed(context, "/personalData");
                }),
            TemplateProfileMenu(
                imgURL:AppImages.icPatientCount ,
                title: "Manage Users",
                tabPressed: () {
                  Navigator.pushNamed(context, route.searchUser);
                }),

            TemplateProfileMenu(
                imgURL: AppImages.icUnMuteVideoCall,
                title: "Manage Videos",
                tabPressed: () {
                  Navigator.pushNamed(context, route.manageVideos);
                }),
            TemplateProfileMenu(
                imgURL: AppImages.icMyPlan,
                title: "Manage Plans",
                tabPressed: () {
                  Navigator.pushNamed(context, route.managePlans);
                }),
            TemplateProfileMenu(
                imgURL: AppImages.icSchedule,
                title: "Manage Schedule",
                tabPressed: () {
                  Navigator.pushNamed(context, route.viewSchedule);
                }),
            TemplateProfileMenu(
                imgURL: AppImages.icTransactions,
                title: "Transactions",
                tabPressed: () {
                  Navigator.pushNamed(context, route.transactions);
                }),

            /*TemplateProfileMenu(
                imgURL: AppImages.icAboutUs,
                title: "About Us",
                tabPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()))),
            TemplateProfileMenu(
                imgURL: AppImages.icVoiceCall,
                title: "Contact Us",
                tabPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContactUs()))),*/
            TemplateProfileMenu(
                imgURL: AppImages.icShareUs,
                title: "Share Us",
                tabPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShareUs()))),
            TemplateProfileMenu(
              imgURL: AppImages.icLogOut,
              title: "Logout",
              tabPressed: () {
                showAlertDialog(context);
              },
            ),


            const SizedBox(
              height: 10,
            ),
            ViewMyRichText(
              text1: "Version",
              text2: "1.0",
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        _storage.clearStorage().then((value) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Logout?"),
      content: const Text("Do you really want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
