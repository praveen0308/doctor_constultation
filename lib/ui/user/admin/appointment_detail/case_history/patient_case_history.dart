import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/view_heading_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PatientCaseHistory extends StatefulWidget {
  final int patientId;
  const PatientCaseHistory({Key? key, required this.patientId})
      : super(key: key);

  @override
  State<PatientCaseHistory> createState() => _PatientCaseHistoryState();
}

class _PatientCaseHistoryState extends State<PatientCaseHistory> {
  late PatientCaseHistoryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<PatientCaseHistoryCubit>(context);
    _cubit.getCaseHistoryOfPatient(widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ViewHeadingAppointment(
          imgURL: AppImages.icPastAppointmentPrimary,
          txtTitle: "Case History",
          txtSubTitle: "hide history",
          sImg: 20,
          tColor: AppColors.greyBefore,
          sColor: AppColors.primary,
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<PatientCaseHistoryCubit, PatientCaseHistoryState>(
          builder: (context, state) {
            if (state is Error) {
              return Center(
                child: Text(state.msg),
              );
            }
            if (state is NoCaseHistory) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "No Case history!!!!",
                    style: AppTextStyle.overlieRF1(),
                  ),
                ),
              );
            }
            if (state is ReceivedCaseHistory) {
              var lastIndex = state.caseHistory.length - 1;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.caseHistory.length,
                  itemBuilder: (_, index) {
                    var caseInfo = state.caseHistory[index];
                    if (index == lastIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/appointmentDetailPage",
                              arguments:
                                  state.caseHistory[index].AppointmentID);
                        },
                        child: TimelineTile(
                          afterLineStyle: const LineStyle(
                              thickness: 2.5, color: AppColors.primaryLight),
                          endChild: TemplateTimelineChild(
                            txtDate: caseInfo.getCaseDate(),
                            txtTiming: caseInfo.getCaseTiming(),
                            txtTitle: caseInfo.ChiefComplaints,
                            txtCaption1: caseInfo.InvestigationNotes,
                          ),
                          isLast: true,
                          indicatorStyle: const IndicatorStyle(
                              color: AppColors.primaryLight,
                              width: 18,
                              height: 18,
                              indicatorXY: 0.0),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/appointmentDetailPage",
                              arguments:
                                  state.caseHistory[index].AppointmentID);
                        },
                        child: TimelineTile(
                          afterLineStyle: const LineStyle(
                              thickness: 2.5, color: AppColors.primaryLight),
                          endChild: TemplateTimelineChild(
                            txtDate: caseInfo.getCaseDate(),
                            txtTiming: caseInfo.getCaseTiming(),
                            txtTitle: caseInfo.ChiefComplaints,
                            txtCaption1: caseInfo.InvestigationNotes,
                          ),
                          isFirst: true,
                          indicatorStyle: const IndicatorStyle(
                              color: AppColors.primaryLight,
                              width: 18,
                              height: 18,
                              indicatorXY: 0.0),
                        ),
                      );
                    }
                  });
            }
            return const LoadingView(isVisible: true);
          },
        )
      ],
    );
  }
}

class TemplateTimelineChild extends StatelessWidget {
  final String txtDate;
  final String txtTiming;
  final String txtTitle;
  final String txtCaption1;

  const TemplateTimelineChild({
    Key? key,
    this.txtDate = "DD MMm YYYY",
    this.txtTiming = "00:00 AM",
    this.txtTitle = "Title",
    this.txtCaption1 = "Caption1",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txtDate,
            style: AppTextStyle.captionRF1(
                txtColor: AppColors.greyDark, wFont: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            txtTiming.toUpperCase(),
            style: AppTextStyle.captionOF2(
                txtColor: AppColors.greyBefore, wFont: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: AppColors.primaryLight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txtTitle,
                    style: AppTextStyle.subtitle1(
                        txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    txtCaption1,
                    style: AppTextStyle.captionRF1(
                        txtColor: AppColors.greyDark, wFont: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
