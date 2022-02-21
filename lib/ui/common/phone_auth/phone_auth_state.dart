part of 'phone_auth_cubit.dart';


abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class Loading extends PhoneAuthState {}

class Error extends PhoneAuthState {
  final String msg;
  Error(this.msg);
}

class OtpVerified extends PhoneAuthState {}

class LoginSuccessful extends PhoneAuthState {
  final int roleId;
  LoginSuccessful(this.roleId);
}

class EnterUserDetails extends PhoneAuthState {}

class OnVerificationCompleted extends PhoneAuthState {}

class OnVerificationFailed extends PhoneAuthState {}

class TimeOut extends PhoneAuthState {}

class OtpSent extends PhoneAuthState {}

class IncorrectOtp extends PhoneAuthState {}

class InvalidPhoneNumber extends PhoneAuthState {}

class WaitingForAutoVerification extends PhoneAuthState {}
