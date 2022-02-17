import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/youtube/youtube_video.dart';
import 'package:doctor_consultation/ui/widgets/fact_myth.dart';
import 'package:doctor_consultation/ui/widgets/patient_review.dart';
import 'package:doctor_consultation/ui/widgets/template_schedule_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'res/image_path.dart';

class HomePageTesting extends StatefulWidget {
  const HomePageTesting({Key? key}) : super(key: key);

  @override
  _HomePageTestingState createState() => _HomePageTestingState();
}

class _HomePageTestingState extends State<HomePageTesting> {
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
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            color: AppColors.primaryLightest,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),

        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 20,
                  child: SvgPicture.asset(AppImages.icSnapping),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Your next appoinment",
                      style: AppTextStyle.body3(txtColor: AppColors.greyDark)
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TemplateScheduleDetail(),
            ),

          ],
        ));
  }

  Widget _body() {
    return Container(
      color: AppColors.greyLight,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
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
