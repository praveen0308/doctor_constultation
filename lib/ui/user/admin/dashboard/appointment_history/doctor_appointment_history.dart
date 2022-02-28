import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/appointment_history/doctor_appointment_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/schedule_nav_bar.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/appointment_history/appointment_history_content.dart';
import 'package:doctor_consultation/ui/widgets/appointment/admin_appointment_summery_detail_header.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DoctorAppointmentHistory extends StatefulWidget {
  const DoctorAppointmentHistory({
    Key? key,
  }) : super(key: key);

  @override
  _DoctorAppointmentHistoryState createState() =>
      _DoctorAppointmentHistoryState();
}

class _DoctorAppointmentHistoryState extends State<DoctorAppointmentHistory> {
  DateTime selectedDate = DateTime.now();
  late DoctorAppointmentHistoryCubit _appointmentHistoryCubit;

  @override
  void initState() {
    super.initState();
    _appointmentHistoryCubit =
        BlocProvider.of<DoctorAppointmentHistoryCubit>(context);
    _appointmentHistoryCubit
        .getAppointmentsByDate(DateFormat("yyyy-MM-dd").format(selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScheduleNavBar(
            txtAddress: "Marine Line, Mumbai",
          ),
          Text(
            "Your Appointments",
            style: AppTextStyle.headline6(txtColor: AppColors.primary),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            DateFormat("MMMM dd, EEEE").format(selectedDate),
            style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
          ),
          const SizedBox(
            height: 10,
          ),
          DatePicker(
            DateTime.now(),
            height: 90,
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.primary,
            selectedTextColor: Colors.white,
            daysCount: 30,
            onDateChange: (date) {
              selectedDate = date;
              _appointmentHistoryCubit
                  .getAppointmentsByDate(DateFormat("yyyy-MM-dd").format(date));
              setState(() {});
            },
          ),
          // TemplateAdminAppointmentHeader(),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: AppointmentHistoryContent())
        ],
      ),
    );
  }
}
