import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/patient_address_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  final PatientRepository _patientRepository;
  AddPatientCubit(this._patientRepository) : super(AddPatientInitial());

  void addNewPatient(PatientDetailModel patientDetailModel,
      PatientAddressModel addressModel) async {
    emit(Loading());
    try {
      int response = await _patientRepository
          .createUpdatePatientDetail(patientDetailModel);
      if (response != 0) {
        addPatientAddress(response, addressModel);
      } else {
        emit(Error("Add Patient Failed !!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void addPatientAddress(
      int patientId, PatientAddressModel patientAddressModel) async {
    emit(Loading());
    try {
      patientAddressModel.PatientID = patientId;
      bool response = await _patientRepository
          .createUpdatePatientAddress(patientAddressModel);
      if (response) {
        emit(PatientAddedSuccessfully());
      } else {
        emit(Error("Failed !!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
