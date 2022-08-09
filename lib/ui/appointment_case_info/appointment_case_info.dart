import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/appointment_case_info/appointment_case_info_cubit.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_attachments/case_attachments.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_attachments/case_attachments_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../local/app_storage.dart';
import '../../models/user_roles.dart';
import '../../repository/case_repository.dart';
import '../../res/image_path.dart';
import '../widgets/view_heading_appointment.dart';

class AppointmentCaseInfoArgs {
  final int patientID;
  final int appointmentID;
  final int caseID;

  AppointmentCaseInfoArgs(this.patientID, this.appointmentID, this.caseID);
}

class AppointmentCaseInfo extends StatefulWidget {
  /// case id equal to 0, will be considered as no case info added by user
  final AppointmentCaseInfoArgs args;

  const AppointmentCaseInfo({Key? key, required this.args}) : super(key: key);

  @override
  State<AppointmentCaseInfo> createState() => _AppointmentCaseInfoState();
}

class _AppointmentCaseInfoState extends State<AppointmentCaseInfo> {
  late AppointmentCaseInfoCubit _cubit;
  late CaseInfoModel caseInfoModel;
  final _storage = SecureStorage();
  int userRoleId = 0;
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AppointmentCaseInfoCubit>(context);
    _cubit.init(widget.args.caseID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCaseInfoCubit, AppointmentCaseInfoState>(

      builder: (context, state) {
        if(state is ReceivedCaseDetail){
          caseInfoModel = state.caseInfoModel;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Case Info",
                  style: AppTextStyle.subtitle1(),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/patientDetails",
                        arguments: widget.args.patientID);
                  },
                  child: Text(
                    "View History",
                    style: AppTextStyle.subtitle2(
                      txtColor: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (state is LoadingCaseInfo) const LoadingView(isVisible: true),
            ((){
              if (state is EmptyCaseDetail){
                return Column(children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 180),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryLightest,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Case record not found !!!",
                          style: AppTextStyle.subtitle1(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomBtn(
                      title: "Create Case",
                      onBtnPressed: () {
                        Navigator.pushNamed(context, "/addCaseInfo",
                            arguments: AddCaseInfoArgs(
                                widget.args.patientID, widget.args.appointmentID,
                                caseId: widget.args.caseID));
                      },
                      isLoading: false)
                ]);}
              else if (state is ReceivedCaseDetail){
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 180),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                        color: AppColors.primaryLightest,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getDetailItem("Case ID",
                            state.caseInfoModel.ID.toString()),
                        getDetailItem("Chief Complaints",
                            state.caseInfoModel.ChiefComplaints),
                        Row(
                          children: [
                            Expanded(
                                child: getDetailItem("Pulse",
                                    "${state.caseInfoModel.Pulse} BPM")),
                            Expanded(
                                child: getDetailItem("Temperature",
                                    "${state.caseInfoModel.Temperature} °F")),
                          ],
                        ),
                        getDetailItem(
                            "Past History", state.caseInfoModel.PastHistory),
                        getDetailItem("Family History",
                            state.caseInfoModel.FamilyHistory),
                        getDetailItem("Observations",
                            state.caseInfoModel.ClinicalObservations.isEmpty ? "Not Provided": state.caseInfoModel.ClinicalObservations),
                        getDetailItem("Investigation Notes",
                            state.caseInfoModel.InvestigationNotes.isEmpty ? "Not Provided": state.caseInfoModel.InvestigationNotes),
                        getDetailItem(
                            "Diagnosis", state.caseInfoModel.Diagnosis.isEmpty ? "Not Provided": state.caseInfoModel.Diagnosis),
                      ],
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: BlocProvider(
                      create: (context) =>
                          CaseAttachmentsCubit(CaseRepository()),
                      child: CaseAttachments(caseID: widget.args.caseID,),
                    ),
                  ),
                  if(userRoleId==UserRoles.doctor)
                  CustomBtn(
                      title: "Update Case Info",
                      onBtnPressed: () {
                        Navigator.pushNamed(context, "/addCaseInfo",
                            arguments: AddCaseInfoArgs(
                                widget.args.patientID, widget.args.appointmentID,
                                caseId: widget.args.caseID));
                      },
                      isLoading: false)

                ]);

              }
              else{
              return const Text("Loading....");
              }


            }()),
            const SizedBox(
              height: 32,
            ),
          ],
        );
      },
    );
  }
}



Widget getDetailItem(String title, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: AppTextStyle.subtitle1(),
        )
      ],
    ),
  );
}
