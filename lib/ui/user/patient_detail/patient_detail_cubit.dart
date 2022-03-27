import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'patient_detail_state.dart';

class PatientDetailCubit extends Cubit<PatientDetailState> {
  final PatientRepository _patientRepository;
  final CaseRepository _caseRepository;
  PatientDetailCubit(this._patientRepository, this._caseRepository)
      : super(PatientDetailInitial());

  void getPatientDetailById(int patientId) async {
    emit(Loading());
    try {
      PatientDetailModel response =
          await _patientRepository.getPatientDetailsByPatientId(patientId);
      if (response != null) {
        emit(ReceivedPatientDetails(response));
        getCaseHistory(response.ID!);
      } else {
        emit(Error("Failed to get patient details!!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void getCaseHistory(int patientId) async {
    emit(Loading());
    try {
      List<CaseInfoModel> response =
          await _caseRepository.getCaseHistoryByPatientID(patientId);
      if (response != null) {
        emit(ReceivedCaseHistory(response));
      } else {
        emit(Error("Failed to get patient history!!!"));
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
