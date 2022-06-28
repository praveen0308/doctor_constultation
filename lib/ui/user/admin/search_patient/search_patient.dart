
import 'package:doctor_consultation/ui/user/admin/search_patient/search_patient_cubit.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/btn/search_patient_filter.dart';
import '../../../widgets/loading_view.dart';
import '../../../widgets/no_records_view.dart';
import '../../../widgets/patient/alpha_patient.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({Key? key}) : super(key: key);

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  late SearchPatientCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<SearchPatientCubit>(context);
    _cubit.getAllPatients();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Manage Patients"),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ViewSearchPatientFilter(
                  onTextUpdated: (txt) {
                    _cubit.filterUser(txt);
                  },
                ),
              ),
              BlocBuilder<SearchPatientCubit, SearchPatientState>(
                builder: (context, state) {
                  if (state is Error) {
                    showToast(state.msg, ToastType.error);
                  }
                  if (state is ReceivedPatients) {
                    if (state.patients.isEmpty) {
                      return NoRecordsView(
                          title: "No patients found!!!", onBtnClick: () {});
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: state.patients.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            var user = state.patients[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/patientDetails",
                                    arguments: state.patients[index].ID);
                              },
                              child: TemplateAlphaPatient(
                                name: user.FullName!,
                                age: "${user.Age} Years",
                                gender: user.getGender(),
                                subtitle: user.MobileNo!, picUrl: user.getProfileUrl(),
                              ),
                            );
                          });
                    }
                  }
                  return LoadingView(isVisible: state is Loading);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
