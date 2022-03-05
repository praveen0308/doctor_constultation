import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_date.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_detail_cubit.dart';
import 'appointment_summery_detail_body.dart';
import 'case_history/patient_case_history.dart';
import 'case_history/patient_case_history_cubit.dart';

class AppointmentDetailPage extends StatefulWidget {
  final AppointmentDetailModel appointmentDetailModel;

  const AppointmentDetailPage({Key? key, required this.appointmentDetailModel})
      : super(key: key);

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  late AppointmentDetailModel _appointmentDetailModel;
  late AppointmentDetailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AppointmentDetailCubit>(context);
    _appointmentDetailModel = widget.appointmentDetailModel;

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
          child: BlocBuilder<AppointmentDetailCubit, AppointmentDetailState>(
            builder: (context, state) {

              if(state is AppointmentCancelled){
                showToast("Appointment cancelled",ToastType.success);
                _cubit.getAppointmentDetail(_appointmentDetailModel.AppointmentID);

              }
              if(state is SessionStarted){
                showToast("Session started",ToastType.success);
                _cubit.getAppointmentDetail(_appointmentDetailModel.AppointmentID);
              }
              if(state is ReceivedAppointmentDetail){
                _appointmentDetailModel = state.appointmentDetailModel;
                setState(() {

                });
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
                            widget.appointmentDetailModel.AppointmentID.toString(),
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
                            title: widget.appointmentDetailModel
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
                      /*BlocProvider(
                    create: (context) => AppointmentDetailCubit(AppointmentRepository()),
                    child: TemplateAppointmentBody(
                      appointmentDetailModel: widget.appointmentDetailModel,),
                  ),*/
                      Text(
                        widget.appointmentDetailModel.PatientName,
                        style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppStrings.speciaList.toUpperCase(),
                        style:
                            AppTextStyle.subtitle2(txtColor: AppColors.greyBefore),
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
                                widget.appointmentDetailModel.getAppointmentDate(),
                          ),
                          TemplateDateTime(
                            imgURL: AppImages.icTimingPrimary,
                            imgSize: 18,
                            dtColor: AppColors.greyBefore,
                            title: widget.appointmentDetailModel.getTiming(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TemplateICText(
                        txtTitle: "Location",
                        txtSubTitle: widget.appointmentDetailModel.UserAddress!
                            .getPreparedAddress(),
                        txtCaption:
                            widget.appointmentDetailModel.UserAddress!.getCityPin(),
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
                          patientId: widget.appointmentDetailModel.PatientID,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (widget.appointmentDetailModel.AppointmentStatusID ==
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
                                    _cubit.cancelAppointment(widget.appointmentDetailModel.AppointmentID);
                                  }, isLoading: state is CancellingAppointment,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                child: CustomBtn(
                                  title: "Start Session",
                                  onBtnPressed: () {
                                    _cubit.startSession(widget.appointmentDetailModel.AppointmentID);
                                  },
                                  isLoading: state is StartingSession,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (widget.appointmentDetailModel.AppointmentStatusID ==
                          AppConstants.ongoing)
                        CustomBtn(
                          title: "Add Case Info",
                          onBtnPressed: () {
                            Navigator.pushNamed(context, "/addCaseInfo",arguments: widget.appointmentDetailModel.PatientID);
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
