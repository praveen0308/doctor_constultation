import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewTodayTask extends StatelessWidget {
  const ViewTodayTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cSize = 160.0;
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    final Size _chartSize = new Size(cSize, cSize);
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
          padding: const EdgeInsets.only(left: 20,right: 40),
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors.greyLightest,
              boxShadow: const [BoxShadow(
                color: AppColors.grey,
                blurRadius: 10.0,
              ),],
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
                    "03 Jan, 2022",
                    style: AppTextStyle.headline5(txtColor: AppColors.primary,wFont: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Need to complete appoinment",
                    style: AppTextStyle.body1(txtColor: AppColors.greyBefore,wFont: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              Expanded(
                flex: 1,
                child: AnimatedCircularChart(
                  edgeStyle: SegmentEdgeStyle.round,
                  holeRadius: 35,
                  key: _chartKey,
                  size: _chartSize,
                  initialChartData: <CircularStackEntry>[
                    new CircularStackEntry(
                      <CircularSegmentEntry>[
                        new CircularSegmentEntry(
                          13.33,
                          AppColors.primary,
                          rankKey: 'completed',
                        ),
                        new CircularSegmentEntry(
                          86.67,
                          AppColors.primaryLight,
                          rankKey: 'remaining',
                        ),
                      ],
                      rankKey: 'progress',
                    ),
                  ],
                  chartType: CircularChartType.Radial,
                  percentageValues: true,
                  holeLabel: '2/15',
                  labelStyle: AppTextStyle.headline6(txtColor: AppColors.primary, wFont: FontWeight.w500
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
