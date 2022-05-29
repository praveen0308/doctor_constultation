import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewTodayTask extends StatelessWidget {
  final int remainingAppointment;
  final int totalAppointment;
  final int completedAppointment;

  const ViewTodayTask(
      {Key? key,
      required this.remainingAppointment,
      required this.completedAppointment,
      required this.totalAppointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cSize = 160.0;
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        GlobalKey<AnimatedCircularChartState>();
    const Size _chartSize = Size(cSize, cSize);
    return Container(
        padding:
            const EdgeInsets.only(left: 20, right: 40, top: 16, bottom: 16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.greyLightest,
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today’s Appointment",
                  style: AppTextStyle.headline5(
                    txtColor: AppColors.greyDark,
                  ),
                ),
                Text(
                  DateTimeHelper.getCurrentDate(),
                  style: AppTextStyle.headline5(
                      txtColor: AppColors.primary, wFont: FontWeight.w700),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  totalAppointment == 0
                      ? "No Appointments"
                      : "Need to complete appointment",
                  style: AppTextStyle.body1(
                      txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            if (totalAppointment != 0)
              Expanded(
                flex: 1,
                child: AnimatedCircularChart(
                  edgeStyle: SegmentEdgeStyle.round,
                  holeRadius: 35,
                  key: _chartKey,
                  size: _chartSize,
                  initialChartData: <CircularStackEntry>[
                    CircularStackEntry(
                      <CircularSegmentEntry>[
                        CircularSegmentEntry(
                          (completedAppointment / totalAppointment) * 100,
                          AppColors.primary,
                          rankKey: 'completed',
                        ),
                        CircularSegmentEntry(
                          (remainingAppointment / totalAppointment) * 100,
                          AppColors.primaryLight,
                          rankKey: 'remaining',
                        ),
                      ],
                      rankKey: 'progress',
                    ),
                  ],
                  chartType: CircularChartType.Radial,
                  percentageValues: true,
                  holeLabel: '$completedAppointment/$totalAppointment',
                  labelStyle: AppTextStyle.headline6(
                      txtColor: AppColors.primary, wFont: FontWeight.w500),
                ),
              ),
          ],
        ));
  }
}
