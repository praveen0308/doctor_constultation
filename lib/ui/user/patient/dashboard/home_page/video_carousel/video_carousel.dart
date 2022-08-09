import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/ui/widgets/youtube/template_video_slider.dart';
import 'package:flutter/material.dart';

class VideoCarousel extends StatefulWidget {
  final List<VideoModel> videos;
  const VideoCarousel({Key? key, required this.videos}) : super(key: key);

  @override
  _VideoCarouselState createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<VideoCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ViewMyRichText(
              text1: "YouTube",
              text2: " Video's",
              txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/manageVideos"),
              child: Text(
                "See more",
                style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TemplateVideoSlider(
            videos: widget.videos,
          ),
        )
      ],
    );
  }
}
