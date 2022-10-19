import 'package:doctor_consultation/ui/widgets/timeline/view_timeline_first2.dart';
import 'package:doctor_consultation/ui/widgets/timeline/view_timeline_last2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ViewTimelineEducation extends StatelessWidget {

  const ViewTimelineEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
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
          txtYear: "1997",
          txtMonth: "April",
          txtTitle: "Senior Secondary",
          txtSubTitle: "CBSE Board, KV Salt Lake, Kolkata",
        ),
      ],
    );
  }
}