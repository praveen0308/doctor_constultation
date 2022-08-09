import 'package:doctor_consultation/ui/user/patient/dashboard/appointment_history/appointment_history_item.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/appointment_history/patient_appointment_history_cubit.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_tab.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/template_schedule_detail.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppointmentHistory extends StatefulWidget {
  const PatientAppointmentHistory({Key? key}) : super(key: key);

  @override
  _PatientAppointmentHistoryPageState createState() =>
      _PatientAppointmentHistoryPageState();
}

class _PatientAppointmentHistoryPageState
    extends State<PatientAppointmentHistory> {
  late PatientAppointmentHistoryCubit _appointmentHistoryCubit;

  @override
  void initState() {
    super.initState();
    _appointmentHistoryCubit =
        BlocProvider.of<PatientAppointmentHistoryCubit>(context);

    _appointmentHistoryCubit.fetchAppointHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNavBar(
              txtAddress: "",
            ),
            Text(
              "Let's check",
              style: AppTextStyle.headline6(txtColor: AppColors.primary),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Your Schedule",
              style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
            ),
            const SizedBox(
              height: 10,
            ),
            BtnTabView(
              txtTab1: "All",
              txtTab2: "Completed",
              txtTab3: "Canceled",
              onSwitched: (index) {
                _appointmentHistoryCubit.filterAppointment(index);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<PatientAppointmentHistoryCubit,
                  PatientAppointmentHistoryState>(
                builder: (context, state) {
                  if (state is Error) {
                    return Center(
                      child: Text(state.msg),
                    );
                  }
                  if (state is NoAppointmentHistory) {
                    return SizedBox(height:400,child: NoRecordsView(title: "No appointment records!!!", onBtnClick: (){}));
                  }
                  if (state is ReceivedAppointmentHistory) {
                    return ListView.builder(
                        itemCount: state.appointments.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AppointmentHistoryItem(
                            appointmentDetailModel: state.appointments[index],
                            onViewDetailsClick: (int appointmentId) {
                              Navigator.pushNamed(
                                  context, "/appointmentDetailPage",
                                  arguments: appointmentId);
                            },
                            onCancelClick: (int appointmentId) {
                              _appointmentHistoryCubit
                                  .cancelAppointment(appointmentId);
                            },
                          );
                        });
                  }
                  return const LoadingView(isVisible: true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
