import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/material.dart';

import 'appointment_summery_detail_body.dart';

class AppointmentDetailPage extends StatefulWidget {

  final AppointmentDetailModel appointmentDetailModel;

  AppointmentDetailPage({Key? key, required this.appointmentDetailModel}) : super(key: key);

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Appointment Detail"),),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Appointment ID",
                    style: AppTextStyle.body1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                  Text(
                    "DS-TI52633",
                    style: AppTextStyle.subtitle1(
                        txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: AppTextStyle.body1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                  ViewInfoChip(
                    title: "Approved".toUpperCase(),
                    bgColor: AppColors.successLightest,
                    txtColor: AppColors.successDark,
                  )
                ],
              ),
              const SizedBox(height: 24,),
              TemplateAppointmentBody(appointmentDetailModel: widget.appointmentDetailModel,)
            ],
          ),
        ),
      ),
    );
  }
}
