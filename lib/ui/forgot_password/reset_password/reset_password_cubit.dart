import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../network/utils/network_exceptions.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AccountRepository _accountRepository;
  ResetPasswordCubit(this._accountRepository) : super(ResetPasswordInitial());

  void resetPassword(String email) async {
    emit(Loading());
    try {

      bool response =
      await _accountRepository.resetPassword(email);

      if (response) {
        emit(ResetPasswordSuccessful());
      } else {
        emit(ResetPasswordFailed());
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
