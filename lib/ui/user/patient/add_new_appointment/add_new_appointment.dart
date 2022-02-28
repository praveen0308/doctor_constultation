import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/add_new_appointment_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/available_slots/appointment_available_slots.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/available_slots/appointment_available_slots_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/patients/patients_of_user.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/patients/patients_of_user_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../repository/schedule_repository.dart';

class AddNewAppointment extends StatefulWidget {
  const AddNewAppointment({Key? key}) : super(key: key);

  @override
  _AddNewAppointmentState createState() => _AddNewAppointmentState();
}

class _AddNewAppointmentState extends State<AddNewAppointment> {
  late AddNewAppointmentCubit _addNewAppointmentCubit;

  @override
  void initState() {
    super.initState();
    _addNewAppointmentCubit = BlocProvider.of<AddNewAppointmentCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Add New Appointment"),
      ),
      body: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocProvider(
                  create: (context) =>
                      AppointmentAvailableSlotsCubit(ScheduleRepository()),
                  child: AppointmentAvailableSlots(),
                ),
                BlocProvider(
                  create: (context) => PatientsOfUserCubit(PatientRepository()),
                  child: const PatientsOfUser(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Write your problem (Optional)",
                  style:
                      AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (text) =>
                      _addNewAppointmentCubit.problemDescription = text,
                  onFieldSubmitted: (text) =>
                      _addNewAppointmentCubit.problemDescription = text,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: AppColors.greyLight,
                      hintText: 'Please write here your problem',
                      hintStyle: TextStyle(color: AppColors.grey)),
                  keyboardType: TextInputType.multiline,
                  maxLength: 100,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 64,
                ),
                BlocBuilder<AddNewAppointmentCubit, AddNewAppointmentState>(
                  builder: (context, state) {
                    if (state is AppointmentAddedSuccessfully) {
                      showToast("Appointment booked successfully !!!",
                          ToastType.success);
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushReplacementNamed(context, "/successPage",
                            arguments: _addNewAppointmentCubit.slot);
                      });
                    }
                    if (state is AddAppointmentFailed) {
                      showToast("Failed !!!", ToastType.success);
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: BtnOutline(
                            title: "Cancel",
                            onBtnPressed: () {
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: CustomBtn(
                            title: "Set Appointment",
                            onBtnPressed: () {
                              _addNewAppointmentCubit.addNewAppointment();
                            },
                            isLoading: state is AddingNewAppointment,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
