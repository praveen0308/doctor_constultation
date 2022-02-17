import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/widgets/timeline/template_timeline_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ViewTimelineFirst extends StatelessWidget {
  final String txtDate;
  final String txtTiming;
  final String txtTitle;
  final String txtSubTitle1;
  final String txtSubTitle2;
  final String txtCaption1;
  final String txtCaption2;

  const ViewTimelineFirst({
    Key? key,
    this.txtDate = "DD MMm YYYY",
    this.txtTiming = "00:00 AM",
    this.txtTitle = "Title",
    this.txtSubTitle1 = "SubTitle1",
    this.txtSubTitle2 = "SubTitle2",
    this.txtCaption1 = "Caption1",
    this.txtCaption2 = "Caption2",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TimelineTile(
        afterLineStyle:
            LineStyle(thickness: 2.5, color: AppColors.primaryLight),
        endChild:   TemplateTimelineChild(
          txtDate: txtDate,
          txtTiming: txtTiming,
          txtTitle: txtTitle,
          txtSubTitle1: txtSubTitle1,
          txtCaption1: txtCaption1,
          txtSubTitle2: txtSubTitle2,
          txtCaption2: txtCaption2,
        ),
        isFirst: true,
        indicatorStyle: IndicatorStyle(
            color: AppColors.primaryLight,
            width: 18,
            height: 18,
            indicatorXY: 0.0),
      ),
    );
  }
}
