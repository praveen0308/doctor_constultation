import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:flutter/material.dart';

part 'appointment_case_info_state.dart';

class AppointmentCaseInfoCubit extends Cubit<AppointmentCaseInfoState> {
  final CaseRepository _caseRepository;
  AppointmentCaseInfoCubit(this._caseRepository)
      : super(AppointmentCaseInfoInitial());

  void getCaseInfoDetail(int caseID) async {
    emit(LoadingCaseInfo());
    try {
      CaseInfoModel response = await _caseRepository.fetchCaseInfoByID(caseID);
      if (response != null) {
        emit(ReceivedCaseDetail(response));
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
}
