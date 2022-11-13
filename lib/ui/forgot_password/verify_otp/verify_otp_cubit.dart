import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../network/utils/network_exceptions.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AccountRepository _accountRepository;
  VerifyOtpCubit(this._accountRepository) : super(VerifyOtpInitial());


  void verifyOtp(String email,String otp) async {
    emit(Loading());
    try {
      bool response =
      await _accountRepository.verifyOtp(email,otp);

      if (response) {
        emit(OtpVerificationSuccessful());
      } else {
        emit(OtpVerificationFailed());
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void resendOtp(String email) async {
    emit(Loading());
    try {
      bool response =
      await _accountRepository.resetPassword(email);

      if (response) {
        emit(OtpResendSuccessful());
      } else {
        emit(OtpResendFailed());
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
