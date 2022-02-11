import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/user/patient/dashboard/youtube/youtube_video.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/widgets/btn/btn_circle.dart';
import 'package:doctor_consultation/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/widgets/fact_myth.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/widgets/patient_review.dart';
import 'package:doctor_consultation/widgets/template_achievement.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          AppNavBar(
            txtAddress: "Jari Mari, Sakinaka",
          ),
          Text("Mon, 03 Jan".toUpperCase(), style: (AppTextStyle.button1(txtColor: AppColors.primary))),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Mr. Sunil, Good Morning",
            style: (AppTextStyle.headline6()),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: SvgPicture.asset(AppImages.imgOnBoarding1),
            height: 306,
            width: 306,
          ),
          const SizedBox(
            height: 10,
          ),
          LayoutYouTubeList(),
          const SizedBox(
            height: 10,
          ),
          LayoutHomeopathyFact(),
          const SizedBox(
            height: 10,
          ),
          LayoutPatientReview(),

          const SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}
