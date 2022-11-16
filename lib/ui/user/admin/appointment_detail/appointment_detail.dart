import 'package:doctor_consultation/jitsee/jitsi_meet_methods.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../appointment_case_info/appointment_case_info.dart';
import '../../../appointment_case_info/appointment_case_info_cubit.dart' as aci;
import 'appointment_detail_cubit.dart';

class AppointmentDetailPage extends StatefulWidget {
  final int appointmentId;

  const AppointmentDetailPage({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  late AppointmentDetailModel _appointmentDetailModel;
  late AppointmentDetailCubit _cubit;
  JitsiMeetMethods meetMethods = JitsiMeetMethods();
  final _storage = SecureStorage();
  int userRoleId = 0;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AppointmentDetailCubit>(context);
    _cubit.getAppointmentDetail(widget.appointmentId);
    _storage.getUserRoleId().then((value) {
      setState(() {
        userRoleId = value;
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _cubit.getAppointmentDetail(widget.appointmentId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Appointment Detail"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocConsumer<AppointmentDetailCubit, AppointmentDetailState>(
            listener: (context, state) {
              if (state is ReceivedAppointmentDetail) {
                setState(() {
                  _appointmentDetailModel = state.appointmentDetailModel;
                });
              }
              if (state is AppointmentCancelled) {
                showToast("Appointment cancelled", ToastType.success);
                _cubit.getAppointmentDetail(
                    _appointmentDetailModel.AppointmentID);
              }
              if (state is SessionStarted) {
                _cubit.getAppointmentDetail(
                    _appointmentDetailModel.AppointmentID);
                showToast("Session started", ToastType.success);
                // createNewMeeting();

              }
              if (state is AppointmentClosedSuccessfully) {
                _cubit.getAppointmentDetail(
                    _appointmentDetailModel.AppointmentID);
                showToast(
                    "Appointment closed successfully !!!", ToastType.success);
                // createNewMeeting();

              }
            },
            builder: (context, state) {
              if (state is LoadingAppointmentDetail) {
                return const LoadingView(
                  isVisible: true,
                );
              }
              if (state is Error) {
                return const LoadingView(
                  isVisible: true,
                );
              }

              return Stack(
                children: [
                  ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Appointment ID",
                            style: AppTextStyle.body1(
                                txtColor: AppColors.greyBefore,
                                wFont: FontWeight.w500),
                          ),
                          Text(
                            _appointmentDetailModel.AppointmentNumber
                                .toString(),
                            style: AppTextStyle.subtitle1(
                                txtColor: AppColors.greyDark,
                                wFont: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: AppTextStyle.body1(
                                txtColor: AppColors.greyBefore,
                                wFont: FontWeight.w500),
                          ),
                          ViewInfoChip(
                            title: _appointmentDetailModel
                                .getAppointmentStatus()
                                .toUpperCase(),
                            bgColor: _appointmentDetailModel
                                .getAppointmentStatusBgColor(),
                            txtColor: _appointmentDetailModel
                                .getAppointmentStatusTextColor(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Schedule Date",
                            style: AppTextStyle.body1(
                                txtColor: AppColors.greyBefore,
                                wFont: FontWeight.w500),
                          ),
                          Text(
                            _appointmentDetailModel
                                .getAppointmentDate()
                                .toString(),
                            style: AppTextStyle.subtitle1(
                                txtColor: AppColors.greyDark,
                                wFont: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Scheduled Slot",
                            style: AppTextStyle.body1(
                                txtColor: AppColors.greyBefore,
                                wFont: FontWeight.w500),
                          ),
                          Text(
                            _appointmentDetailModel.getTiming().toString(),
                            style: AppTextStyle.subtitle1(
                                txtColor: AppColors.greyDark,
                                wFont: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Record Date",
                      //       style: AppTextStyle.body1(
                      //           txtColor: AppColors.greyBefore,
                      //           wFont: FontWeight.w500),
                      //     ),
                      //     Text(
                      //       _appointmentDetailModel.getRecordDate().toString(),
                      //       style: AppTextStyle.subtitle1(
                      //           txtColor: AppColors.greyDark,
                      //           wFont: FontWeight.w500),
                      //     ),
                      //   ],
                      // ),
                      const Divider(
                        color: AppColors.primaryLight,
                        thickness: 1.5,
                        height: 20,
                      ),
                      Text(
                        "Patient Info",
                        style: AppTextStyle.subtitle1(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient ID",
                            style: AppTextStyle.body1(
                                txtColor: AppColors.greyBefore,
                                wFont: FontWeight.w500),
                          ),
                          Text(
                            "PT000${_appointmentDetailModel.PatientID.toString()}",
                            style: AppTextStyle.subtitle1(
                                txtColor: AppColors.greyDark,
                                wFont: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient Name",
                            style: AppTextStyle.body1(
                                txtColor: AppColors.greyBefore,
                                wFont: FontWeight.w500),
                          ),
                          Text(
                            _appointmentDetailModel.PatientName.toString(),
                            style: AppTextStyle.subtitle1(
                                txtColor: AppColors.greyDark,
                                wFont: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        color: AppColors.primaryLight,
                        thickness: 1.5,
                        height: 20,
                      ),
                      BlocProvider(
                        create: (context) =>
                            aci.AppointmentCaseInfoCubit(CaseRepository()),
                        child: AppointmentCaseInfo(
                            args: AppointmentCaseInfoArgs(
                                _appointmentDetailModel.PatientID,
                                _appointmentDetailModel.AppointmentID,
                                _appointmentDetailModel.CaseID)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (_appointmentDetailModel.AppointmentStatusID ==
                          AppConstants.pending)
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: BtnOutline(
                                  title: "Cancel",
                                  onBtnPressed: () {
                                    _cubit.cancelAppointment(
                                        _appointmentDetailModel.AppointmentID);
                                  },
                                  isLoading: state is CancellingAppointment,
                                ),
                              ),
                              if (userRoleId == UserRoles.doctor)
                                const SizedBox(
                                  width: 16,
                                ),
                              if (userRoleId == UserRoles.doctor)
                                Flexible(
                                  child: CustomBtn(
                                    title: "Start Session",
                                    onBtnPressed: () {
                                      _cubit.startSession(
                                          _appointmentDetailModel.AppointmentID,
                                          meetMethods.generateMeetingId());
                                    },
                                    isLoading: state is StartingSession,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      if (_appointmentDetailModel.AppointmentStatusID ==
                              AppConstants.ongoing ||
                          _appointmentDetailModel.AppointmentStatusID ==
                              AppConstants.closed)
                        Column(
                          children: [
                            CustomBtn(
                              title: "Join Meeting",
                              onBtnPressed: () {
                                meetMethods.joinMeeting(
                                    roomName:
                                        _appointmentDetailModel.MeetingID!,
                                    isAudioMuted: true,
                                    isVideoMuted: true);
                              },
                              isLoading: false,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      if (userRoleId == UserRoles.doctor)
                        if (_appointmentDetailModel.AppointmentStatusID == AppConstants.ongoing)
                          CustomBtn(
                            title: "Close Appointment",
                            onBtnPressed: () {
                              _cubit.closeAppointment(
                                  _appointmentDetailModel.AppointmentID);
                            },
                            isLoading: false,
                          ),
                    ],
                  ),
                  LoadingView(isVisible: state is LoadingAppointmentDetail)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
