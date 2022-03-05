import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCaseInfo extends StatefulWidget {

  final int patientId;
  const AddCaseInfo({Key? key, required this.patientId}) : super(key: key);

  @override
  State<AddCaseInfo> createState() => _AddCaseInfoState();
}

class _AddCaseInfoState extends State<AddCaseInfo> {
  late AddCaseInfoCubit _cubit;

  final CaseInfoModel _caseInfoModel = CaseInfoModel();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AddCaseInfoCubit>(context);
    _caseInfoModel.PatientInfoID = widget.patientId;
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
                                  onChanged: (text) => _caseInfoModel.Temperature = text,
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
                            onChanged: (text) => _caseInfoModel.FamilyHistory = text,
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
                            onChanged: (text) => _caseInfoModel.ClinicalObservations = text,
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
                            onChanged: (text) => _caseInfoModel.InvestigationNotes = text,
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
                          CustomBtn(
                              title: "Create",
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
}
