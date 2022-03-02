import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/schedule/template_admin_time_with_schedule.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_appointment_history_cubit.dart';

class AppointmentHistoryContent extends StatefulWidget {
  const AppointmentHistoryContent({Key? key}) : super(key: key);

  @override
  State<AppointmentHistoryContent> createState() =>
      _AppointmentHistoryContentState();
}

class _AppointmentHistoryContentState extends State<AppointmentHistoryContent> {
  late DoctorAppointmentHistoryCubit _appointmentHistoryCubit;

  @override
  void initState() {
    super.initState();
    _appointmentHistoryCubit =
        BlocProvider.of<DoctorAppointmentHistoryCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      // margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: AppColors.greyLightest,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryLight,
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: BlocBuilder<DoctorAppointmentHistoryCubit,
          DoctorAppointmentHistoryState>(
        builder: (context, state) {
          if (state is Error) {
            showToast(state.msg, ToastType.error);
          }
          if (state is ReceivedAppointments) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                  child: ViewMyRichText(
                    text1: "Appointment",
                    text2: "(${state.appointments.length.toString()})",
                    txtStyle1: AppTextStyle.captionRF1(
                        txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                    txtStyle2: AppTextStyle.captionRF1(
                        txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
                  ),
                ),
                if (state.appointments.isEmpty)
                  const Expanded(
                    child: Center(
                      child: Text("No Appointments today!!!"),
                    ),
                  )
                else
                  ListView.separated(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (_, index) {
                        return TemplateAdminTimeSchedule(
                          txtMainTime: "09:00 am",
                          txtFrom: state.appointments[index].StartTime,
                          txtTo: state.appointments[index].EndTime,
                          txtTitle: state.appointments[index].PatientName,
                          txtSubTitle: state.appointments[index].Disease,
                          txtCaption: "General",
                          txtColor: AppColors.errorDark,
                          bgColor: AppColors.errorLightest,
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(height: 8);
                      },
                      itemCount: state.appointments.length)
              ],
            );
          }

          return const LoadingView(isVisible: true);
        },
      ),
    );
  }
}
