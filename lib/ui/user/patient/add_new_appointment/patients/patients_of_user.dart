import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/patients/patients_of_user_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsOfUser extends StatefulWidget {
  const PatientsOfUser({Key? key}) : super(key: key);

  @override
  _PatientsOfUserState createState() => _PatientsOfUserState();
}

class _PatientsOfUserState extends State<PatientsOfUser> {
  late PatientsOfUserCubit _cubit;

  final List<PatientDetailModel> _patients = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<PatientsOfUserCubit>(context);
    _cubit.fetchPatientsByUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Patient Records",
          style: AppTextStyle.headline5(),
        ),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<PatientsOfUserCubit, PatientsOfUserState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }

            if (state is ReceivedPatientList) {
              _patients.clear();
              _patients.addAll(state.patients);
              if (_patients.isNotEmpty) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: index == selectedIndex
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                  visible: index == selectedIndex,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Booking for : ",
                                        style: AppTextStyle.headline6(),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  )),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: Center(
                                      child: Text(
                                        _patients[index]
                                            .FullName!
                                            .substring(0, 1),
                                        style: AppTextStyle.headline6(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                      child: Text(
                                    _patients[index].FullName ?? "N.A.",
                                    style: AppTextStyle.headline5(),
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: _patients.length);
              } else {
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text("No patient records found !!"));
              }
            }
            return const LoadingView(isVisible: true);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: CustomBtn(
              title: "Add Patient",
              onBtnPressed: () {
                Navigator.pushNamed(context, "/addPatientInfo");
              },
              isLoading: false),
        ),
      ],
    );
  }
}
