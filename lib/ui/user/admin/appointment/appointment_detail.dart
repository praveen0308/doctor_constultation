import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/appointment/appointment_summery_detail_body.dart';
import 'package:doctor_consultation/ui/widgets/appointment/appointment_summery_detail_header.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: Scaffold(
        body: ListView(
          children: [
            AppBackNavBar(
              txtTitle: "Appointment",
              navColor: AppColors.primary,
              bgColor: AppColors.greyLightest,
            ),
            TemplateAppointmentHeader(),
            TemplateAppointmentBody()
          ],
        ),
      ),
    );
  }
}
