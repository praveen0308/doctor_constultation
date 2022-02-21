import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../network/utils/network_exceptions.dart';
import '../../../repository/account_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final _storage = SecureStorage();
  final AccountRepository _accountRepository;
  RegisterCubit(this._accountRepository) : super(RegisterInitial());

  void checkLoginDetails(UserModel userModel) async {
    emit(Loading());
    try {
      bool response = await _accountRepository.addUpdateUserDetails(userModel);
      if (response) {
        emit(RegistrationSuccessful());
      } else {
        emit(UserAlreadyExist());
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
