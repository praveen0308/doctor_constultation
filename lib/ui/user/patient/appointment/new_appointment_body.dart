import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/appointment/appointment_for.dart';
import 'package:doctor_consultation/ui/widgets/appointment/availabe_slots.dart';
import 'package:doctor_consultation/ui/widgets/appointment/select_date.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_icon_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewAppointmentBody extends StatelessWidget {
  const NewAppointmentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBackNavBar(
              imgUrl: AppImages.icBackArrow,
              txtTitle: "New Appointment",
              navColor: AppColors.primary,
              bgColor: AppColors.greyLightest),
          BtnIconTabView(
            onTabSelected: (int index) {},
          ),
          const SizedBox(
            height: 10,
          ),
          TemplateSelectDate(),

          const SizedBox(
            height: 10,
          ),
          TemplateAvailableSlot(),
          const SizedBox(
            height: 10,
          ),
          TemplateAppointmentView(),
          const SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}
