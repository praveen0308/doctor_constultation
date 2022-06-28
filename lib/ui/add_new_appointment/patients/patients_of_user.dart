import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip_with_icon.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'patients_of_user_cubit.dart';
import '../add_new_appointment_cubit.dart';

class PatientsOfUser extends StatefulWidget {
  const PatientsOfUser({Key? key}) : super(key: key);

  @override
  _PatientsOfUserState createState() => _PatientsOfUserState();
}

class _PatientsOfUserState extends State<PatientsOfUser> {
  late PatientsOfUserCubit _cubit;
  late AddNewAppointmentCubit _addNewAppointmentCubit;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _cubit.fetchPatientsByUserId();
    }
  }
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<PatientsOfUserCubit>(context);
    _addNewAppointmentCubit = BlocProvider.of<AddNewAppointmentCubit>(context);
    _cubit.fetchPatientsByUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Patient Records",
              style: AppTextStyle.headline6(),
            ),
            ViewInfoChipWithIcon(
              imgUrl: AppImages.icPlus,
              title: "Add",
              txtColor: AppColors.primary,
              bgColor: AppColors.primaryLight,
              onMyTab: () async {
                var result = await Navigator.pushNamed(context, "/addPatientInfo");
                if(result==true){
                  _cubit.fetchPatientsByUserId();
                }
              },
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<PatientsOfUserCubit, PatientsOfUserState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }
            if (state is NoPatients) {
              return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text("No patient records found !!"));
            }
            if (state is ReceivedPatientList) {
              _addNewAppointmentCubit.patientDetailModel = state.patients[0];

              return PatientGroups(
                  data: state.patients,
                  onItemClick: (patient) {
                    _addNewAppointmentCubit.patientDetailModel = patient;

                  });
            }
            return const LoadingView(isVisible: true);
          },
        ),
      ],
    );
  }
}

class PatientGroups extends StatefulWidget {
  final Function(PatientDetailModel patientDetailModel) onItemClick;
  final List<PatientDetailModel> data;

  const PatientGroups({Key? key, required this.data, required this.onItemClick})
      : super(key: key);

  @override
  State<PatientGroups> createState() => _PatientGroupsState();
}

class _PatientGroupsState extends State<PatientGroups> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              widget.onItemClick(widget.data[index]);

              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            widget.data[index].FullName!.substring(0, 1),
                            style: AppTextStyle.headline6(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Text(
                        widget.data[index].FullName ?? "N.A.",
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
        itemCount: widget.data.length);
  }
}
