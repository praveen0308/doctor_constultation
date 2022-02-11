import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/timeline/view_timeline_first.dart';
import 'package:doctor_consultation/widgets/timeline/view_timeline_last.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class ViewTimeline extends StatelessWidget {
  final String? title;
  const ViewTimeline({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewTimelineFirst(
          txtDate: "21 December, 2021",
          txtTiming: "09:30 am",
          txtTitle: "Health issue",
          txtSubTitle1: "Doctor",
          txtCaption1: AppStrings.drName,
          txtSubTitle2: "Clinic Staff",
          txtCaption2: "John XYZ",
        ),
        ViewTimelineFirst(
          txtDate: "21 December, 2021",
          txtTiming: "09:30 am",
          txtTitle: "Health issue",
          txtSubTitle1: "Doctor",
          txtCaption1: AppStrings.drName,
          txtSubTitle2: "Clinic Staff",
          txtCaption2: "John XYZ",
        ),
        ViewTimelineFirst(
          txtDate: "21 December, 2021",
          txtTiming: "09:30 am",
          txtTitle: "Health issue",
          txtSubTitle1: "Doctor",
          txtCaption1: AppStrings.drName,
          txtSubTitle2: "Clinic Staff",
          txtCaption2: "John XYZ",
        ),
        ViewTimelineLast(
          txtDate: "21 December, 2021",
          txtTiming: "09:30 am",
          txtTitle: "Health issue",
          txtSubTitle1: "Doctor",
          txtCaption1: AppStrings.drName,
          txtSubTitle2: "Clinic Staff",
          txtCaption2: "John XYZ",
        ),
      ],
    );
  }
}