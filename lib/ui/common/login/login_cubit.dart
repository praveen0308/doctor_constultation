import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _storage = SecureStorage();
  final AccountRepository _accountRepository;

  LoginCubit(this._accountRepository) : super(LoginInitial());

  void checkLoginDetails(String username, String password) async {
    emit(Loading());
    try {
      UserModel response =
          await _accountRepository.loginUser(username, password);

      _storage.updateUserRoleId(response.UserRoleID!);
      _storage.updateUserId(response.ID!);
      _storage.updateUserName(response.UserName.toString());
      _storage.updateUserEmail(response.EmailID.toString());
      _storage.updatePhoneNumber(response.MobileNo.toString());
      if (response.ProfileImage != null) {
        if(response.ProfileImage!.isNotEmpty){
          _storage.updateUserProfile(response.getProfileUrl());
        }
      }
      _storage.updateLoginStatus(true);

      emit(LoginSuccessful(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(IncorrectCredential());
      debugPrint("Exception >>> $e");
    }

  }

  void updateFCMToken(String token,UserModel userModel) async {
    emit(Loading());
    try {
      bool response = await _accountRepository.updateFCMToken(token);

      emit(TokenUpdatedSuccessfully(userModel));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
