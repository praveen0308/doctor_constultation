import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'manage_users_state.dart';

class ManageUsersCubit extends Cubit<ManageUsersState> {
  final AccountRepository _accountRepository;
  ManageUsersCubit(this._accountRepository) : super(ManageUsersInitial());

  void getAllUsers() async {
    emit(Loading());
    try {
      List<UserModel> response = await _accountRepository.getAllUserDetails();
      emit(ReceivedUsers(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
