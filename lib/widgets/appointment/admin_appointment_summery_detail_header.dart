import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/view_date_patient_visitor.dart';
import 'package:doctor_consultation/widgets/btn/info_chip.dart';
import 'package:flutter/cupertino.dart';

class TemplateAdminAppointmentHeader extends StatefulWidget {
  final int index;

  const TemplateAdminAppointmentHeader({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  State<TemplateAdminAppointmentHeader> createState() =>
      _TemplateAppointmentHeaderState();
}

class _TemplateAppointmentHeaderState extends State<TemplateAdminAppointmentHeader> {
  List<String> dayNList = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This Week Schedules",
            style: AppTextStyle.headline6(txtColor: AppColors.primary),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Jan, 03 Monday",
            style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
          ),
          const SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    7,
                    (index) => ViewDatePatientVisitorContent(
                      title: dayNList[index],
                      subTitle: '0${index + 3}',
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
