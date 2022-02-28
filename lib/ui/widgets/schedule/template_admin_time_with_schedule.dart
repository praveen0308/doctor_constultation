import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/schedule/view_schedule_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class TemplateAdminTimeSchedule extends StatelessWidget {
  final String txtMainTime;
  final String txtFrom;
  final String txtTo;

  final String imgUrl;
  final String txtTitle;
  final String txtSubTitle;
  final String txtCaption;

  final Color txtColor;
  final Color bgColor;

  const TemplateAdminTimeSchedule({
    Key? key,
    this.txtMainTime = "00:00 am",
    this.txtFrom = "00:00 am",
    this.txtTo = "00:30 am",
    this.imgUrl = AppImages.imgAvatar,
    this.txtTitle = "Patient Name",
    this.txtSubTitle = "Type",
    this.txtCaption = "Reason",
    this.txtColor = AppColors.primary,
    this.bgColor = AppColors.primaryLightest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    txtMainTime.toUpperCase(),
                    style: AppTextStyle.captionOF2(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                ),
                lineGen(
                  lines: [10.0, 20.0],
                )
              ],
            ),
          ),*/
          Flexible(
            flex: 7,
            child: ViewScheduleAdmin(
              imgUrl: imgUrl,
              txtTitle: txtTitle,
              txtSubTitle: txtSubTitle,
              txtCaption: txtCaption,
              txtTime1: txtFrom,
              txtTime2: txtTo,
              txtColor: txtColor,
              bgColor: bgColor,
              onMyTap: () =>
                  Navigator.pushNamed(context, route.appointmentDetailPage),
            ),
          ),
        ],
      ),
    );
  }
}

class lineGen extends StatelessWidget {
  final lines;

  const lineGen({Key? key, this.lines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            2,
            (index) => Container(
                  height: 2.0,
                  width: lines[index],
                  color: AppColors.primaryLight,
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                )));
  }
}
