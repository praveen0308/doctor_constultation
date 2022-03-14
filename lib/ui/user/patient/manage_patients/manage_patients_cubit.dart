import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'manage_patients_state.dart';

class ManagePatientsCubit extends Cubit<ManagePatientsState> {
  final PatientRepository _patientRepository;
  ManagePatientsCubit(this._patientRepository) : super(ManagePatientsInitial());

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
