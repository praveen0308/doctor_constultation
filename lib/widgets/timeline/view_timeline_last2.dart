import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/timeline/template_timeline_child.dart';
import 'package:doctor_consultation/widgets/timeline/template_timeline_child2.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ViewEducationTimelineLast extends StatelessWidget {
  final String txtYear;
  final String txtMonth;
  final String txtTitle;
  final String txtSubTitle;

  const ViewEducationTimelineLast({
    Key? key,
    this.txtYear = "YYYY",
    this.txtMonth = "MM",
    this.txtTitle = "Title",
    this.txtSubTitle = "SubTitle1",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TimelineTile(
        afterLineStyle:
        LineStyle(thickness: 2.5, color: AppColors.primaryLight),
        endChild:   TemplateTimelineEductionChild(
          txtYear: txtYear,
          txtMonth: '${txtMonth}, ',
          txtTitle: txtTitle,
          txtSubTitle: txtSubTitle,
        ),
        isLast: true,
        indicatorStyle: IndicatorStyle(
            color: AppColors.primaryLight,
            width: 18,
            height: 18,
            indicatorXY: 0.0),
      ),
    );
  }
}
