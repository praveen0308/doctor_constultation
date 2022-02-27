import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';

part 'patients_of_user_state.dart';

class PatientsOfUserCubit extends Cubit<PatientsOfUserState> {
  final PatientRepository _patientRepository;
  PatientsOfUserCubit(this._patientRepository) : super(PatientsOfUserInitial());

  void fetchPatientsByUserId() async {
    emit(Loading());
    try {
      List<PatientDetailModel> response =
          await _patientRepository.fetchPatientByID();

      emit(ReceivedPatientList(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
