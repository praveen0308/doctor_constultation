import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_nav_bar/app_back_filter_nav_bar.dart';
import '../../../widgets/appointment/post_appointment_summery.dart';
import '../../../widgets/no_glow_behaviour.dart';
import '../../../widgets/view_my_rich_text2.dart';

class LayoutPastAppointment extends StatelessWidget {
  const LayoutPastAppointment({Key? key}) : super(key: key);

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
                imgUrl2: AppImages.icFilterPrimary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                child: Column(
                  children: [
                    ViewMyRichThreeText(
                      text1: "Monday",
                      text2: "January 03",
                      text3: "09:30 AM",
                    ),
                    TemplatePostAppointmentSummery()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
