import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'patient_case_history_state.dart';

class PatientCaseHistoryCubit extends Cubit<PatientCaseHistoryState> {
  final CaseRepository _caseRepository;
  PatientCaseHistoryCubit(this._caseRepository) : super(PatientCaseHistoryInitial());

  void getCaseHistoryOfPatient(int patientId) async {
    emit(Loading());
    try {
      List<CaseInfoModel> response =
      await _caseRepository.getCaseHistoryByPatientID(patientId);
      if(response.isNotEmpty){
        emit(ReceivedCaseHistory(response));
      }else{
        emit(NoCaseHistory());
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
