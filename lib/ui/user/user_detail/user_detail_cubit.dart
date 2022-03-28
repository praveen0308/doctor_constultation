import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final AccountRepository _accountRepository;
  final PatientRepository _patientRepository;
  UserDetailCubit(this._accountRepository, this._patientRepository)
      : super(UserDetailInitial());

  void getUserDetailByUserID(int userId) async {
    emit(Loading());
    try {
      UserModel response =
          await _accountRepository.getUserDetailsByUserId(userId);
      if (response != null) {
        emit(ReceivedUserDetails(response));
        await Future.delayed(const Duration(seconds: 1));
        getPatients(response.ID!);
      } else {
        emit(Error("Failed to get user details!!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

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
