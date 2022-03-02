import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/material.dart';
part 'user_addresses_state.dart';

class UserAddressesCubit extends Cubit<UserAddressesState> {
  final AccountRepository _accountRepository;
  UserAddressesCubit(this._accountRepository) : super(UserAddressesInitial());

  void fetchAddressList() async {
    emit(Loading());
    try {
      List<AddressModel> response =
          await _accountRepository.getUserAddressByUserID();

      emit(ReceivedAddressList(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
