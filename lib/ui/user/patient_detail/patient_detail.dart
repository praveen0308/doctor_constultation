import 'dart:html';

import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient_detail/patient_detail_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../admin/appointment_detail/case_history/patient_case_history.dart';

class PatientDetailScreen extends StatefulWidget {
  final int patientId;
  final String imgUrl;

  const PatientDetailScreen(
      {Key? key,
      this.imgUrl = AppImages.imgNotAvailable,
      required this.patientId})
      : super(key: key);

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  late PatientDetailCubit _cubit;
  PatientDetailModel _patientDetailModel = PatientDetailModel();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<PatientDetailCubit>(context);
    _cubit.getPatientDetailById(widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Patient Details"),
      ),
      body: BlocBuilder<PatientDetailCubit, PatientDetailState>(
        builder: (context, state) {
          if (state is ReceivedPatientDetails) {
            _patientDetailModel = state.patientDetailModel;
          }
          if (state is Loading) return const LoadingView(isVisible: true);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ScrollConfiguration(
              behavior: NoGlowBehaviour(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_patientDetailModel.getProfileUrl().isEmpty)
                            const CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage(AppImages.imgAvatar),
                            ),
                          if (_patientDetailModel.getProfileUrl().isNotEmpty)
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                  _patientDetailModel.getProfileUrl()),
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            _patientDetailModel.FullName ?? "N.A.",
                            style: AppTextStyle.headline5(
                                txtColor: AppColors.primary),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${_patientDetailModel.getGender()} - ${_patientDetailModel.Age} Year Old",
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Case History",
                      style: AppTextStyle.subtitle1(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (state is LoadingAppointmentHistory)
                      const LoadingView(isVisible: true),
                    if (state is ReceivedCaseHistory)
                      (() {
                        if (state.caseHistory.isEmpty) {
                          return SizedBox(
                            height: 150,
                            child: Center(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    imgUrl,
                                    height: 200,
                                  ),
                                  Text(
                                    "No History !!!",
                                    style: AppTextStyle.captionOF1(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          var lastIndex = state.caseHistory.length - 1;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.caseHistory.length,
                              itemBuilder: (_, index) {
                                var caseInfo = state.caseHistory[index];
                                if (index == lastIndex) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/appointmentDetailPage",
                                          arguments: state.caseHistory[index]
                                              .AppointmentID);
                                    },
                                    child: TimelineTile(
                                      afterLineStyle: const LineStyle(
                                          thickness: 2.5,
                                          color: AppColors.primaryLight),
                                      endChild: TemplateTimelineChild(
                                        txtDate: caseInfo.getCaseDate(),
                                        txtTiming: caseInfo.getCaseTiming(),
                                        txtTitle: caseInfo.ChiefComplaints,
                                        txtCaption1:
                                            caseInfo.InvestigationNotes,
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
                                      Navigator.pushNamed(
                                          context, "/appointmentDetailPage",
                                          arguments: state.caseHistory[index]
                                              .AppointmentID);
                                    },
                                    child: TimelineTile(
                                      afterLineStyle: const LineStyle(
                                          thickness: 2.5,
                                          color: AppColors.primaryLight),
                                      endChild: TemplateTimelineChild(
                                        txtDate: caseInfo.getCaseDate(),
                                        txtTiming: caseInfo.getCaseTiming(),
                                        txtTitle: caseInfo.ChiefComplaints,
                                        txtCaption1:
                                            caseInfo.InvestigationNotes,
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
                      }())
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
