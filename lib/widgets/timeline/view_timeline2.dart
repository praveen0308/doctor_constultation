import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/timeline/view_timeline_first.dart';
import 'package:doctor_consultation/widgets/timeline/view_timeline_first2.dart';
import 'package:doctor_consultation/widgets/timeline/view_timeline_last.dart';
import 'package:doctor_consultation/widgets/timeline/view_timeline_last2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class ViewTimelineEducation extends StatelessWidget {

  const ViewTimelineEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewEducationTimelineFirst(
          txtYear: "2010",
          txtMonth: "March",
          txtTitle: "D.H.M. in Homeopathy",
          txtSubTitle: "British Institute Of Homeopathy, London",
        ),
        ViewEducationTimelineFirst(
          txtYear: "2006",
          txtMonth: "April",
          txtTitle: "M.D. in Homeopathy",
          txtSubTitle: "Bombay University",
        ),

        ViewEducationTimelineFirst(
          txtYear: "2003",
          txtMonth: "April",
          txtTitle: "B.H.M.S.",
          txtSubTitle: "Calcutta University",
        ),

        ViewEducationTimelineLast(
          txtYear: "2001",
          txtMonth: "Februray",
          txtTitle: "H.S.C.",
          txtSubTitle: "Maharshtra State Board",
        ),
      ],
    );
  }
}