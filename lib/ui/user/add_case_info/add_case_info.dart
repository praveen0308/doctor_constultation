import 'dart:io';

import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/empty_data_container.dart';
import 'package:doctor_consultation/ui/widgets/file_view.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCaseInfoArgs {
  final int patientId;
  final int appointmentId;
  final int caseId;

  AddCaseInfoArgs(this.patientId, this.appointmentId, {this.caseId = 0});
}

class AddCaseInfo extends StatefulWidget {
  final AddCaseInfoArgs caseInfoArgs;
  const AddCaseInfo({Key? key, required this.caseInfoArgs}) : super(key: key);

  @override
  State<AddCaseInfo> createState() => _AddCaseInfoState();
}

class _AddCaseInfoState extends State<AddCaseInfo> {
  late AddCaseInfoCubit _cubit;

  late CaseInfoModel _caseInfoModel = CaseInfoModel();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AddCaseInfoCubit>(context);
    _caseInfoModel.PatientInfoID = widget.caseInfoArgs.patientId;
    _caseInfoModel.AppointmentID = widget.caseInfoArgs.appointmentId;
    if (widget.caseInfoArgs.caseId != 0) {
      _cubit.getCaseInfoDetail(widget.caseInfoArgs.caseId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Case"),
        ),
        body: BlocBuilder<AddCaseInfoCubit, AddCaseInfoState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }
            if (state is AddedSuccessfully) {
              showToast("Added successfully !!!", ToastType.success);

              _cubit.close();
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pop(context);
              });
            }

            if (state is LoadingCaseInfo) {
              return const LoadingView(isVisible: true);
            }
            if (state is ReceivedCaseInfo) {
              _caseInfoModel = state.caseInfoModel;
            }
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                  child: ScrollConfiguration(
                behavior: NoGlowBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: TextEditingController()
                          ..text = _caseInfoModel.ChiefComplaints,
                        onChanged: (text) =>
                            _caseInfoModel.ChiefComplaints = text,
                        onFieldSubmitted: (text) =>
                            _caseInfoModel.ChiefComplaints = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter chief complaints',
                          labelText: 'Chief Complaints',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: TextEditingController()
                                ..text = _caseInfoModel.Pulse,
                              onChanged: (text) => _caseInfoModel.Pulse = text,
                              onFieldSubmitted: (text) =>
                                  _caseInfoModel.Pulse = text,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '120/80',
                                labelText: 'Pulse Rate',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: TextEditingController()
                                ..text = _caseInfoModel.Temperature,
                              onChanged: (text) =>
                                  _caseInfoModel.Temperature = text,
                              onFieldSubmitted: (text) =>
                                  _caseInfoModel.Temperature = text,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '100 F',
                                labelText: 'Temperature',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: TextEditingController()
                          ..text = _caseInfoModel.PastHistory,
                        onChanged: (text) => _caseInfoModel.PastHistory = text,
                        onFieldSubmitted: (text) =>
                            _caseInfoModel.PastHistory = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter past history',
                          labelText: 'Past History',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: TextEditingController()
                          ..text = _caseInfoModel.FamilyHistory,
                        onChanged: (text) =>
                            _caseInfoModel.FamilyHistory = text,
                        onFieldSubmitted: (text) =>
                            _caseInfoModel.FamilyHistory = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter family history',
                          labelText: 'Family History',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: TextEditingController()
                          ..text = _caseInfoModel.ClinicalObservations,
                        onChanged: (text) =>
                            _caseInfoModel.ClinicalObservations = text,
                        onFieldSubmitted: (text) =>
                            _caseInfoModel.ClinicalObservations = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter observations',
                          labelText: 'Clinical Observations',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: TextEditingController()
                          ..text = _caseInfoModel.InvestigationNotes,
                        onChanged: (text) =>
                            _caseInfoModel.InvestigationNotes = text,
                        onFieldSubmitted: (text) =>
                            _caseInfoModel.InvestigationNotes = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your notes',
                          labelText: 'Investigation Note',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: TextEditingController()
                          ..text = _caseInfoModel.Diagnosis,
                        onChanged: (text) => _caseInfoModel.Diagnosis = text,
                        onFieldSubmitted: (text) =>
                            _caseInfoModel.Diagnosis = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter diagnosis',
                          labelText: 'Diagnosis',
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Attachments",
                          style: AppTextStyle.subtitle1(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (_cubit.files.isEmpty)
                        const EmptyDataContainer(msg: "No attachments !!!"),
                      if (_cubit.files.isNotEmpty)
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                            }),
                      CustomBtn(
                          title: "Add Attachments",
                          onBtnPressed: () {
                            pickFiles();
                          },
                          isLoading: false),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomBtn(
                          title: "Submit",
                          onBtnPressed: () {
                            _cubit.addCaseInfo(_caseInfoModel);
                          },
                          isLoading: state is Loading)
                    ],
                  ),
                ),
              )),
            );
          },
        ),
      ),
    );
  }

  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      List<File> iFiles = result.paths.map((path) => File(path!)).toList();
      _cubit.addFiles(iFiles);
    } else {
      // User canceled the picker
    }
  }
}
