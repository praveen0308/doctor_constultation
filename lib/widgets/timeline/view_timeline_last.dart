import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ViewTimelineLast extends StatelessWidget {
  final String txtDate;
  final String txtTiming;
  final String txtTitle;
  final String txtSubTitle1;
  final String txtSubTitle2;
  final String txtCaption1;
  final String txtCaption2;

  const ViewTimelineLast({
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
        endChild:   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txtDate,
                style: AppTextStyle.captionRF1(
                    txtColor: AppColors.greyDark, wFont: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                txtTiming.toUpperCase(),
                style: AppTextStyle.captionOF2(
                    txtColor: AppColors.greyBefore, wFont: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.primaryLight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        txtTitle,
                        style: AppTextStyle.subtitle1(
                            txtColor: AppColors.greyDark,
                            wFont: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                txtSubTitle1,
                                style: AppTextStyle.captionRF2(
                                    txtColor: AppColors.greyBefore),
                              ),
                              Text(
                                txtCaption1,
                                style: AppTextStyle.captionRF1(
                                    txtColor: AppColors.greyDark,
                                    wFont: FontWeight.w500),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                txtSubTitle2,
                                style: AppTextStyle.captionRF2(
                                    txtColor: AppColors.greyBefore),
                              ),
                              Text(
                                txtCaption2,
                                style: AppTextStyle.captionRF1(
                                    txtColor: AppColors.greyDark,
                                    wFont: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
