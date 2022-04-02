import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_patient_chats_state.dart';

class UserPatientChatsCubit extends Cubit<UserPatientChatsState> {
  final PatientRepository _patientRepository;
  UserPatientChatsCubit(this._patientRepository)
      : super(UserPatientChatsInitial());

  void getPatients(int userId) async {
    emit(LoadingPatients());
    try {
      List<PatientDetailModel> response =
          await _patientRepository.fetchPatientByID(userId: userId);
      if (response != null) {
        emit(ReceivedPatientRecords(response));
      } else {
        emit(Error("Failed to get patient records!!!"));
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
