import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_case_info_state.dart';

class AddCaseInfoCubit extends Cubit<AddCaseInfoState> {
  final CaseRepository _caseRepository;

  AddCaseInfoCubit(this._caseRepository) : super(AddCaseInfoInitial());
  void addCaseInfo(CaseInfoModel caseInfoModel) async {
    emit(Loading());
    try {
      bool response = await _caseRepository.createUpdateCaseInfo(caseInfoModel);
      if(response){
        emit(AddedSuccessfully());
      }else{
        emit(Error("Failed to add case!!!"));
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
