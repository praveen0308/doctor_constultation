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
  late String _verificationId;
  PhoneAuthCubit(this.accountRepository) : super(PhoneAuthInitial());

  void verifyMobileNumber(String mobileNumber) async {
    emit(Loading());
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91$mobileNumber',
        verificationCompleted: (PhoneAuthCredential credential) {
          _verificationId = credential.verificationId!;

          auth.signInWithCredential(credential).then((value) {
            emit(OnVerificationCompleted());
            User user = value.user!;
            checkLoginDetails(UserModel(
                UserName: user.displayName,
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
