
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/youtube/youtube_video_list.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/widgets/youtube/template_video_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutYouTubeList extends StatefulWidget {
  const LayoutYouTubeList({Key? key}) : super(key: key);

  @override
  _LayoutYouTubeListState createState() => _LayoutYouTubeListState();
}

class _LayoutYouTubeListState extends State<LayoutYouTubeList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ViewMyRichText(
              text1: "YouTube",
              text2: "Video's",
              txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),
            GestureDetector(
              onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubeList())),
              child: Text(
                "See more",
                style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
              ),
            ),
          ],
        ),
        Container(
          // color: AppColors.error,
          // width: MediaQuery.of(context).size.width,

          margin: EdgeInsets.symmetric(vertical: 10),
          child: TemplateVideoSlider(),
        )
      ],
    );
  }
}
