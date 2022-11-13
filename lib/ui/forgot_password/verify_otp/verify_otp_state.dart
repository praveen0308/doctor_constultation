part of 'verify_otp_cubit.dart';

@immutable
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class Loading extends VerifyOtpState {}
class Error extends VerifyOtpState {
  final String msg;

  Error(this.msg);

}


class OtpVerificationSuccessful extends VerifyOtpState {}
class OtpVerificationFailed extends VerifyOtpState {}

class OtpResendSuccessful extends VerifyOtpState {}
class OtpResendFailed extends VerifyOtpState {}
