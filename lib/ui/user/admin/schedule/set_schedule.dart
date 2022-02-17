import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/widgets/btn/view_timing.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/widgets/view_date_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LayoutSetSchedule extends StatefulWidget {
  final int index;

  const LayoutSetSchedule({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  State<LayoutSetSchedule> createState() => _LayoutSetScheduleState();
}

class _LayoutSetScheduleState extends State<LayoutSetSchedule> {
  List<String> dayNList = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  List<String> mSlot = [
    "09:00 am",
    "09:30 am",
    "10:00 am",
    "10:30 am",
    "11:00 am",
    "11:30 am",
  ];

  List<String> aSlot = [
    "12:00 pm",
    "12:30 pm",
    "01:30 pm",
    "01:00 pm",
    "02:00 pm",
    "02:30 pm",
    "03:00 pm",
    "03:30 pm",
  ];
  List<String> eSlot = [
    "04:00 pm",
    "04:30 pm",
    "05:00 pm",
    "05:30 pm",
    "06:00 pm",
    "06:30 pm",
    "07:00 pm",
    "07:30 pm",
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackNavBar(
                txtTitle: "Set Appointment",
                navColor: AppColors.primary,
                bgColor: AppColors.greyLightest,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Jan 20, 2022".toUpperCase(),
                    style: AppTextStyle.captionRF1(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    AppImages.icArrowDown,
                    height: 8,
                    color: AppColors.greyDark,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      7,
                      (index) => ViewDateAdminContent(
                        title: dayNList[index],
                        subTitle: '${index + 10}',
                        mainColor: AppColors.primary,
                        innerColor: AppColors.primary,
                        outerColor: AppColors.primaryLightest,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Set Slot".toUpperCase(),
                style: AppTextStyle.captionRF1(txtColor: AppColors.greyDark),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Morning",
                  style: AppTextStyle.captionRF1(
                      txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                ),
              ),
              Wrap(
                spacing: 20,
                runSpacing: 5,
                children: List.generate(
                  mSlot.length,
                  (index) => ViewTiming(
                    txtTiming: mSlot[index],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Afternoon",
                  style: AppTextStyle.captionRF1(
                      txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                ),
              ),
              Wrap(
                spacing: 20,
                runSpacing: 5,
                children: List.generate(
                  aSlot.length,
                      (index) => ViewTiming(
                    txtTiming: aSlot[index],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Evening",
                  style: AppTextStyle.captionRF1(
                      txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                ),
              ),
              Wrap(
                spacing: 20,
                runSpacing: 5,
                children: List.generate(
                  eSlot.length,
                      (index) => ViewTiming(
                    txtTiming: eSlot[index],
                  ),
                ),
              ),
              const Spacer(),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BtnFilled(onBtnPressed: (){},
                  title: "Set Appointment",),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
