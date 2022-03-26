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
  final List<UserModel> users = [];
  void getAllUsers() async {
    emit(Loading());
    try {
      List<UserModel> response = await _accountRepository.getAllUserDetails();
      users.clear();
      users.addAll(response);
      emit(ReceivedUsers(users));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void filterUser(String q) {
    List<UserModel> filteredUsers = [];
    filteredUsers.clear();
    if (q.isEmpty) {
      filteredUsers.addAll(users);
    } else {
      for (var user in users) {
        if (user.UserName!.contains(q)) {
          filteredUsers.add(user);
        }
      }
    }
    emit(ReceivedUsers(filteredUsers));
  }
}
