import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../local/app_storage.dart';
import '../../repository/account_repository.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final _storage = SecureStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  final AccountRepository accountRepository;
  String _verificationId = "";
  String phoneNumber = "";

  PhoneAuthCubit(this.accountRepository) : super(PhoneAuthInitial());

  void verifyMobileNumber(String mobileNumber) async {
    phoneNumber = mobileNumber;
    emit(Loading());
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91$mobileNumber',
        verificationCompleted: (PhoneAuthCredential credential) {
          _verificationId = credential.verificationId!;

          auth.signInWithCredential(credential).then((userCredential) {
            emit(OnVerificationCompleted());
            User? user = userCredential.user;

            user = auth.currentUser;
            checkLoginDetails(UserModel(
                UserName: user!.displayName,
                EmailID: user.email,
                MobileNo: user.phoneNumber));
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == "invalid-phone-number") {
            emit(InvalidPhoneNumber());
          } else {
            emit(Error(e.message ?? "Something went wrong!!!"));
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          emit(OtpSent());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(TimeOut());
        },
      );
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void verifyOtp(String code) async {
    emit(Loading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: code);
    try {
      var userCredential = await auth.signInWithCredential(credential);
      User? user = userCredential.user;
      await user?.reload();
      user = auth.currentUser;
      checkLoginDetails(UserModel(
          UserName: user!.displayName,
          EmailID: user.email,
          MobileNo: user.phoneNumber));
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-verification-code") {
        emit(IncorrectOtp());
      }

      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void checkLoginDetails(UserModel userModel) async {
    emit(Loading());
    try {
      UserModel response = await accountRepository.checkLoginDetails(userModel);
      _storage.updateUserRoleId(response.UserRoleID!);
      emit(LoginSuccessful(response.UserRoleID!));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
