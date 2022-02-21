import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../local/app_storage.dart';
import '../../../models/api/user_model.dart';
import '../../../network/utils/network_exceptions.dart';
import '../../../repository/account_repository.dart';

part 'enter_user_detail_state.dart';

class EnterUserDetailCubit extends Cubit<EnterUserDetailState> {
  final _storage = SecureStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  final AccountRepository accountRepository;
  EnterUserDetailCubit(this.accountRepository)
      : super(EnterUserDetailInitial());

  void updateUserDetails(String name, String email) async {
    emit(Loading());
    try {
      bool response = await accountRepository
          .addUpdateUserDetails(UserModel(EmailID: email, UserName: name));

      if (response) {
        _storage.updateUserEmail(email);
        _storage.updateUserName(name);
        var roleId = await _storage.getUserRoleId();
        emit(Success(roleId));
      } else {
        emit(Failed());
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
