import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/appointment_history/doctor_appointment_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/schedule_nav_bar.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/appointment_history/appointment_history_content.dart';
import 'package:doctor_consultation/ui/widgets/appointment/admin_appointment_summery_detail_header.dart';
import 'package:doctor_consultation/ui/widgets/custom_dropdown.dart';
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
  DateTime startDay = DateTime.now();
  int noOfDays = 30;
  late DoctorAppointmentHistoryCubit _appointmentHistoryCubit;
  final List<String> statusFilters = ["Pending", "Closed", "Cancelled"];
  final List<String> dateFilters = [
    "Next 30 days",
    "Last Week",
    "Last Month",
    "Last 3 Months",
    "Custom"
  ];

  @override
  void initState() {
    super.initState();
    _appointmentHistoryCubit =
        BlocProvider.of<DoctorAppointmentHistoryCubit>(context);
    _appointmentHistoryCubit.getAppointmentsByDate(startDay);
  }

  void openDateRangePicker() async {
    var selectedDateRange = await showDateRangePicker(
        context: context, firstDate: DateTime(2021), lastDate: DateTime(2025));

    if (selectedDateRange != null) {
      _appointmentHistoryCubit.selectedDateRange(selectedDateRange);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocBuilder<DoctorAppointmentHistoryCubit,
          DoctorAppointmentHistoryState>(
        builder: (context, state) {
          if (state is ChooseDateRange) {
            openDateRangePicker();
          }
          if (state is OnDateSelected) startDay = state.date;
          if (state is ReceivedDates) {
            startDay = state.startDate;
            noOfDays = state.noOfDays;
            _appointmentHistoryCubit.getAppointmentsByDate(startDay);
          }
          return ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ScheduleNavBar(
                  txtAddress: "",
                ),
                Text(
                  "Your Appointments",
                  style: AppTextStyle.headline6(txtColor: AppColors.primary),
                ),
                const SizedBox(
                  height: 5,
                ),

                Text(
                  DateFormat("MMMM dd, EEEE").format(startDay),
                  style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 10,
                ),
                //#region filter
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomDropDown(
                          isOutlined: true,
                          selectedIndex: 0,
                          hint: statusFilters[
                              _appointmentHistoryCubit.selectedStatus],
                          itemList: statusFilters,
                          onItemSelected: (item) {
                            _appointmentHistoryCubit.filterAppointmentByStatus(
                                statusFilters.indexOf(item));
                          }),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomDropDown(
                          isOutlined: true,
                          selectedIndex: 0,
                          hint: dateFilters[
                              _appointmentHistoryCubit.selectedDateFilter],
                          itemList: dateFilters,
                          onItemSelected: (item) {
                            _appointmentHistoryCubit
                                .applyDateFilter(dateFilters.indexOf(item));
                          }),
                    ),
                  ],
                ),
                //#endregion
                DatePicker(
                  startDay,
                  height: 90,
                  initialSelectedDate: startDay,
                  selectionColor: AppColors.primary,
                  selectedTextColor: Colors.white,
                  daysCount: noOfDays,
                  onDateChange: (date) {
                    _appointmentHistoryCubit.getAppointmentsByDate(date);
                  },
                ),
                // TemplateAdminAppointmentHeader(),
                const SizedBox(
                  height: 16,
                ),
                const Expanded(child: AppointmentHistoryContent())
              ],
            ),
          );
        },
      ),
    );
  }
}
