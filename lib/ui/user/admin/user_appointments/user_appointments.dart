import 'package:doctor_consultation/ui/user/admin/user_appointments/user_appointments_cubit.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../res/style_text.dart';
import '../../../widgets/loading_view.dart';
import '../../../widgets/template_schedule_detail.dart';
import '../../add_case_info/add_case_info.dart';

class UserAppointments extends StatefulWidget {
  final int userID;
  const UserAppointments({Key? key, required this.userID}) : super(key: key);

  @override
  State<UserAppointments> createState() => _UserAppointmentsState();
}

class _UserAppointmentsState extends State<UserAppointments> {

  late UserAppointmentsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<UserAppointmentsCubit>(context);
    _cubit.fetchAppointHistory(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Appointment History"),

        ),
        body: BlocBuilder<UserAppointmentsCubit, UserAppointmentsState>(
          builder: (context, state) {

            if(state is AppointmentCancelled){
              _cubit.fetchAppointHistory(widget.userID);
            }

            if(state is SessionStarted){
              _cubit.fetchAppointHistory(widget.userID);
            }
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }
            if(state is NoAppointmentHistory){
              return Expanded(
                  child: Center(
                    child: Text(
                      "No appointments !!!",
                      style: AppTextStyle.subtitle1(),
                    ),
                  ));
            }
            if(state is ReceivedAppointments) {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return TemplateScheduleDetail(
                      appointmentDetailModel: state.appointments[index],
                      onCancelClick: (int appointmentId) {
                        _cubit
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

                      },
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 8);
                  },
                  itemCount: state.appointments.length);
            }
            return LoadingView(isVisible: state is Loading);
          },
        ),
      ),
    );
  }
}
