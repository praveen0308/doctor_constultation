import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  final PatientRepository _patientRepository;
  final AccountRepository _accountRepository;

  AddPatientCubit(this._patientRepository, this._accountRepository) : super(AddPatientInitial());
  File? selectedProfileImage;
  late int patientID;
  void addNewPatient(PatientDetailModel patientDetailModel) async {
    emit(Loading());
    try {
      int response = await _patientRepository
          .createUpdatePatientDetail(patientDetailModel);
      if (response != 0) {
        patientID = response;

        emit(PatientAddedSuccessfully());
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

  void uploadProfileImage() async {
    emit(Loading());
    try {

      String response = await _accountRepository.uploadProfileImage(

          selectedProfileImage!.path,
        selectedProfileImage!.path.split('/').last,patientID : patientID,);
      if (response.isNotEmpty) {
        emit(ProfileAddedSuccessfully());
      } else {
        emit(Error("Add Profile Failed !!!"));
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
