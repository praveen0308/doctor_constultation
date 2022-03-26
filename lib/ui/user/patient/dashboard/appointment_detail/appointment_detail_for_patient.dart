import 'package:doctor_consultation/jitsee/jitsi_meet_methods.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history_cubit.dart';
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

import 'appointment_detail_for_patient_cubit.dart';

class AppointmentDetailForPatientPage extends StatefulWidget {
  final int appointmentId;

  const AppointmentDetailForPatientPage({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  State<AppointmentDetailForPatientPage> createState() =>
      _AppointmentDetailForPatientPageState();
}

class _AppointmentDetailForPatientPageState
    extends State<AppointmentDetailForPatientPage> {
  late AppointmentDetailForPatientCubit _cubit;
  late AppointmentDetailModel _appointmentDetailModel;
  JitsiMeetMethods meetMethods = JitsiMeetMethods();
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AppointmentDetailForPatientCubit>(context);

    _cubit.getAppointmentDetail(widget.appointmentId);
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
          child: BlocBuilder<AppointmentDetailForPatientCubit,
              AppointmentDetailForPatientState>(
            builder: (context, state) {
              if (state is AppointmentCancelled) {
                showToast("Appointment cancelled", ToastType.success);
                _cubit.getAppointmentDetail(
                    _appointmentDetailModel.AppointmentID);
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
                          height: 24,
                        ),
                        Text(
                          _appointmentDetailModel.PatientName,
                          style: AppTextStyle.subtitle1(
                              txtColor: AppColors.greyDark),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          AppStrings.speciaList.toUpperCase(),
                          style: AppTextStyle.subtitle2(
                              txtColor: AppColors.greyBefore),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TemplateDateTime(
                              imgURL: AppImages.icSchedulePrimary,
                              imgSize: 18,
                              dtColor: AppColors.greyBefore,
                              title:
                                  _appointmentDetailModel.getAppointmentDate(),
                            ),
                            TemplateDateTime(
                              imgURL: AppImages.icTimingPrimary,
                              imgSize: 18,
                              dtColor: AppColors.greyBefore,
                              title: _appointmentDetailModel.getTiming(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TemplateICText(
                          txtTitle: "Location",
                          txtSubTitle:
                              _appointmentDetailModel.UserAddress != null
                                  ? _appointmentDetailModel.UserAddress!
                                      .getPreparedAddress()
                                  : "N.A.",
                          txtCaption:
                              _appointmentDetailModel.UserAddress != null
                                  ? _appointmentDetailModel.UserAddress!
                                      .getCityPin()
                                  : "N.A.",
                          txtTColor: AppColors.greyBefore,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(AppImages.imgMap),
                                  fit: BoxFit.fill,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.primaryLight,
                                    blurRadius: 5.0,
                                  ),
                                ]),
                          ),
                        ),
                        const Divider(
                          color: AppColors.grey,
                          thickness: 1.5,
                          height: 20,
                        ),
                        BlocProvider(
                          create: (context) =>
                              PatientCaseHistoryCubit(CaseRepository()),
                          child: PatientCaseHistory(
                            patientId: _appointmentDetailModel.PatientID,
                          ),
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
                                Flexible(
                                  child: CustomBtn(
                                    title: "Update Case Info",
                                    onBtnPressed: () {
                                      //todo update case info
                                    },
                                    isLoading: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (_appointmentDetailModel.AppointmentStatusID ==
                            AppConstants.ongoing)
                          Column(
                            children: [
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

              return const LoadingView(isVisible: true);
            },
          ),
        ),
      ),
    );
  }
}
