import 'dart:math';

import 'package:doctor_consultation/jitsee/jitsi_meet_methods.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/appointment_case_info/appointment_case_info.dart';
import 'package:doctor_consultation/ui/appointment_case_info/appointment_case_info_cubit.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_date.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_detail_cubit.dart';
import 'case_history/patient_case_history.dart';
import 'case_history/patient_case_history_cubit.dart';

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

/*
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    meetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }
*/

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
          child: BlocBuilder<AppointmentDetailCubit, AppointmentDetailState>(
            builder: (context, state) {
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
              if (state is ReceivedAppointmentDetail) {
                _appointmentDetailModel = state.appointmentDetailModel;
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
                              bgColor: AppColors.successLightest,
                              txtColor: AppColors.successDark,
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
                              _appointmentDetailModel.getAppointmentDate()
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Added On",
                              style: AppTextStyle.body1(
                                  txtColor: AppColors.greyBefore,
                                  wFont: FontWeight.w500),
                            ),
                            Text(
                              _appointmentDetailModel.Addedon.toString(),
                              style: AppTextStyle.subtitle1(
                                  txtColor: AppColors.greyDark,
                                  wFont: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Divider(
                          color: AppColors.grey,
                          thickness: 1.5,
                          height: 20,
                        ),

                        Text(
                          "Patient Info",
                          style: AppTextStyle.subtitle1(),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                          margin: const EdgeInsets.symmetric(vertical: 16),


                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.primaryLightest
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                _appointmentDetailModel.PatientProfileUrl!.isEmpty ? const NetworkImage("https://www.kindpng.com/picc/m/252-2524695_dummy-profile-image-jpg-hd-png-download.png") : NetworkImage(_appointmentDetailModel.PatientProfileUrl.toString()),
                                backgroundColor: Colors.transparent,
                              ),
                              const SizedBox(width: 16,),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _appointmentDetailModel.PatientName,
                                    style: AppTextStyle.subtitle1(
                                        txtColor: AppColors.greyDark),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "ID : ${_appointmentDetailModel.PatientID.toString()}",
                                    style: AppTextStyle.subtitle2(
                                        txtColor: AppColors.greyBefore),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),

                        BlocProvider(
                          create: (context) =>
                              AppointmentCaseInfoCubit(CaseRepository()),
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
                                          _appointmentDetailModel
                                              .AppointmentID);
                                    },
                                    isLoading: state is CancellingAppointment,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                if (userRoleId == UserRoles.doctor)
                                  Flexible(
                                    child: CustomBtn(
                                      title: "Start Session",
                                      onBtnPressed: () {
                                        _cubit.startSession(
                                            _appointmentDetailModel
                                                .AppointmentID,
                                            meetMethods.generateMeetingId());
                                      },
                                      isLoading: state is StartingSession,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        if (_appointmentDetailModel.AppointmentStatusID ==
                            AppConstants.ongoing)
                          Column(
                            children: [
                              /*CustomBtn(
                                title: "Add Case Info",
                                onBtnPressed: () {
                                  Navigator.pushNamed(context, "/addCaseInfo",
                                      arguments: AddCaseInfoArgs(
                                          _appointmentDetailModel.PatientID,
                                          _appointmentDetailModel
                                              .AppointmentID));
                                },
                                isLoading: false,
                              ),*/
                              const SizedBox(
                                height: 16,
                              ),
                              CustomBtn(
                                title: "Join Meeting",
                                onBtnPressed: () {
                                  meetMethods.createMeeting(
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
                      ],
                    ),
                    LoadingView(isVisible: state is LoadingAppointmentDetail)
                  ],
                );
              }

              return const LoadingView(
                isVisible: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
