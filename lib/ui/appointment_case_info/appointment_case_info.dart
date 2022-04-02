import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/appointment_case_info/appointment_case_info_cubit.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Case Info",
              style: AppTextStyle.subtitle1(),
            ),
            const SizedBox(
              height: 16,
            ),
            if (state is LoadingCaseInfo) const LoadingView(isVisible: true),
            if (state is EmptyCaseDetail)
              Column(children: [
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
              ]),
            if (state is ReceivedCaseDetail)
              Column(children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 180),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryLightest,
                        borderRadius: BorderRadius.circular(8)),
                    child: CaseInfoDetails(caseInfoModel: state.caseInfoModel),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomBtn(
                    title: "Update Case Info",
                    onBtnPressed: () {
                      Navigator.pushNamed(context, "/addCaseInfo",
                          arguments: AddCaseInfoArgs(
                              widget.args.patientID, widget.args.appointmentID,
                              caseId: widget.args.caseID));
                    },
                    isLoading: false)
              ]),
            const SizedBox(
              height: 32,
            ),
          ],
        );
      },
    );
  }
}

class CaseInfoDetails extends StatelessWidget {
  final CaseInfoModel caseInfoModel;
  const CaseInfoDetails({Key? key, required this.caseInfoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getDetailItem("Chief Complaints", caseInfoModel.ChiefComplaints),
        Row(
          children: [
            getDetailItem("Pulse", caseInfoModel.Pulse),
            getDetailItem("Temperature", caseInfoModel.Temperature),
          ],
        ),
        getDetailItem("Past History", caseInfoModel.PastHistory),
        getDetailItem("Family History", caseInfoModel.ChiefComplaints),
        getDetailItem("Observations", caseInfoModel.ChiefComplaints),
        getDetailItem("Investigation Notes", caseInfoModel.ChiefComplaints),
        getDetailItem("Diagnosis", caseInfoModel.Diagnosis),
        /*if (caseInfoModel.files.isEmpty)
          const EmptyDataContainer(msg: "No attachments !!!"),
        if (_cubit.files.isNotEmpty)
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _cubit.files.length,
              itemBuilder: (BuildContext context, int index) {
                return FileView(
                  file: _cubit.files[index],
                  onDelete: () {
                    _cubit.removeFile(index);
                  },
                );
              }),*/
      ],
    );
  }
}

Widget getDetailItem(String title, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    child: Column(
      children: [
        Text(
          title,
          style: AppTextStyle.subtitle1(),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          value,
          style: AppTextStyle.subtitle2(),
        )
      ],
    ),
  );
}
