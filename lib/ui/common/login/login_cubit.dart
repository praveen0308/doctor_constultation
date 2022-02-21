import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../network/utils/network_exceptions.dart';

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
      _storage.updateUserName(response.UserName!);
      _storage.updateUserEmail(response.EmailID!);
      _storage.updateUserEmail(response.MobileNo!);
      _storage.updateLoginStatus(true);

      emit(LoginSuccessful(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
