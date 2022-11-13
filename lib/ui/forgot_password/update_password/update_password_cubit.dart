import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  final AccountRepository _accountRepository;
  UpdatePasswordCubit(this._accountRepository) : super(UpdatePasswordInitial());

  void updatePassword(String email,String password) async {
    emit(Loading());
    try {
      bool response =
      await _accountRepository.updatePassword(email,password);

      if (response) {
        emit(UpdatePasswordSuccessful());
      } else {
        emit(UpdatePasswordFailed());
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
