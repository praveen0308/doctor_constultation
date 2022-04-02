import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  final _storage = SecureStorage();
  final AccountRepository _accountRepository;
  PersonalDataCubit(this._accountRepository) : super(PersonalDataInitial());

  void getUserDetail() async {
    emit(Loading());
    try {
      var userID = await _storage.getUserId();
      UserModel response =
          await _accountRepository.getUserDetailsByUserId(userID);
      if (response != null) {
        emit(ReceivedUserDetails(response));
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

  void updateUserDetails(UserModel userModel) async {
    emit(Updating());
    try {
      int response = await _accountRepository.addUpdateUserDetails(userModel);
      if (response != 0) {
        emit(UpdatedSuccessfully());
      } else {
        emit(Error("Failed to update user details!!!"));
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