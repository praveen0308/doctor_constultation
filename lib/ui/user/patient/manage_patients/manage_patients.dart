import 'package:doctor_consultation/ui/user/patient/manage_patients/manage_patients_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/patient/alpha_patient.dart';
import 'package:doctor_consultation/ui/widgets/patient_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagePatients extends StatefulWidget {
  const ManagePatients({Key? key}) : super(key: key);

  @override
  State<ManagePatients> createState() => _ManagePatientsState();
}

class _ManagePatientsState extends State<ManagePatients> {
  late ManagePatientsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ManagePatientsCubit>(context);
    _cubit.fetchPatientsByUserId();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Manage Patients"),
      ),
      body: BlocBuilder<ManagePatientsCubit, ManagePatientsState>(
        builder: (context, state) {
          if (state is Error) {
            return NoRecordsView(
                title: state.msg,
                onBtnClick: () {
                  _cubit.fetchPatientsByUserId();
                });
          }
          if (state is ReceivedPatientList) {
            if (state.patients.isEmpty) {
              return NoRecordsView(
                  title: "No patient records!!!", onBtnClick: () {});
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
                        Navigator.pushNamed(context, "/patientDetails",
                            arguments: state.patients[index].ID);
                      },
                      child: TemplateAlphaPatient(
                        name: user.FullName!,
                        age: "${user.Age} Years",
                        gender: user.getGender(),
                        subtitle: user.MobileNo ?? "N.A.",
                        picUrl: user.getProfileUrl(),
                      ),
                    );
                  });
            }
          }

          return const LoadingView(isVisible: true);
        },
      ),
    ));
  }
}
