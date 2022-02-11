import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/schedule_nav_bar.dart';
import 'package:doctor_consultation/widgets/appointment/admin_appointment_summery_detail_body.dart';
import 'package:doctor_consultation/widgets/appointment/admin_appointment_summery_detail_header.dart';
import 'package:doctor_consultation/widgets/btn/btn_tab.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';

class DoctorScheduleHistoryPage extends StatefulWidget {

  const DoctorScheduleHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  _DoctorScheduleHistoryPageState createState() =>
      _DoctorScheduleHistoryPageState();
}

class _DoctorScheduleHistoryPageState extends State<DoctorScheduleHistoryPage> {


  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        scrollDirection: Axis.vertical,
        children: [
          ScheduleNavBar(txtAddress: "Marine Line, Mumbai",),
          TemplateAdminAppointmentHeader(),

          TemplateAdminAppointmentBody()
        ],
      ),
    );
  }
}
