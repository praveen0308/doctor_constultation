import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/template_schedule_detail.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../jitsee/jitsi_meet_methods.dart';
import 'doctor_appointment_history_cubit.dart';

class AppointmentHistoryContent extends StatefulWidget {
  const AppointmentHistoryContent({Key? key}) : super(key: key);

  @override
  State<AppointmentHistoryContent> createState() =>
      _AppointmentHistoryContentState();
}

class _AppointmentHistoryContentState extends State<AppointmentHistoryContent> {
  late DoctorAppointmentHistoryCubit _appointmentHistoryCubit;
  JitsiMeetMethods meetMethods = JitsiMeetMethods();
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
      padding: const EdgeInsets.symmetric(vertical: 10),
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
          if (state is CancellingAppointment) {
            showToast("Appointment cancelled", ToastType.success);
          }
          if (state is SessionStarted) {
            showToast("Session started", ToastType.success);
          }

          if (state is Error) {
            // showToast(state.msg, ToastType.error);
            return NoRecordsView(title: state.msg, onBtnClick: () {});
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
                  Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.imgOnBoarding4,height: 170,),
                            SizedBox(height: 16,),
                            Text(
                              "No appointments !!!",
                              style: AppTextStyle.subtitle1(),
                            ),
                          ],
                        ),
                      ))
                else
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (_, index) {
                          return TemplateScheduleDetail(
                            appointmentDetailModel: state.appointments[index],
                            onCancelClick: (int appointmentId) {
                              _appointmentHistoryCubit
                                  .cancelAppointment(appointmentId);
                            },
                            onAddCaseInfoClick: (appointment) {
                              Navigator.pushNamed(context, "/addCaseInfo",
                                  arguments: AddCaseInfoArgs(
                                      appointment.PatientID,
                                      appointment.AppointmentID));
                            },
                            onViewDetailsClick: (int appointmentId) {
                              Navigator.pushNamed(
                                  context, "/appointmentDetailPage",
                                  arguments:
                                      state.appointments[index].AppointmentID);
                            },
                            onStartSessionClick: (int appointmentId) {
                              _appointmentHistoryCubit.startSession(
                                  appointmentId,
                                  meetMethods.generateMeetingId());
                            },
                          );
                        },
                        separatorBuilder: (_, index) {
                          return const SizedBox(height: 8);
                        },
                        itemCount: state.appointments.length),
                  )
              ],
            );
          }

          return const LoadingView(isVisible: true);
        },
      ),
    );
  }
}
