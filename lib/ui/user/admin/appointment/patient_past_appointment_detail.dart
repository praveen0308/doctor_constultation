import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_filter_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/appointment/post_appointment_summery_detail_body.dart';
import 'package:doctor_consultation/ui/widgets/appointment/post_appointment_summery_detail_header.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientPastAppointmentDetailPage extends StatelessWidget {
  const PatientPastAppointmentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              AppBackFilterNavBar(
                imgUrl1: AppImages.icBackArrow,
                txtTitle: "Past appointment",
              ),
              TemplatePastAppointmentSummeryHeaderDetail(),
              TemplatePastAppointmentSummeryBodyDetail()
            ],
          ),
        ),
      ),
    );
  }
}
