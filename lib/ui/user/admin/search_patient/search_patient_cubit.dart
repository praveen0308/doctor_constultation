import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../network/utils/network_exceptions.dart';

part 'search_patient_state.dart';

class SearchPatientCubit extends Cubit<SearchPatientState> {

  final PatientRepository _patientRepository;
  SearchPatientCubit(this._patientRepository) : super(SearchPatientInitial());

  final List<PatientDetailModel> patients = [];
  void getAllPatients() async {
    emit(Loading());
    try {
      List<PatientDetailModel> response = await _patientRepository.fetchAllPatient();
      patients.clear();
      patients.addAll(response);
      emit(ReceivedPatients(patients));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void filterUser(String q) {
    List<PatientDetailModel> filteredUsers = [];
    filteredUsers.clear();
    if (q.isEmpty) {
      filteredUsers.addAll(patients);
    } else {
      for (var user in patients) {
        if (user.FullName!.toLowerCase().contains(q.toLowerCase())) {
          filteredUsers.add(user);
        }
      }
    }
    emit(ReceivedPatients(filteredUsers));
  }
}
