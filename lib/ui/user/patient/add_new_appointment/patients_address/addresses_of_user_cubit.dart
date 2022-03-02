import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/material.dart';
part 'addresses_of_user_state.dart';

class AddressesOfUserCubit extends Cubit<AddressesOfUserState> {
  final AccountRepository _accountRepository;
  AddressesOfUserCubit(this._accountRepository)
      : super(AddressesOfUserInitial());
  void fetchAddressList() async {
    emit(Loading());
    try {
      List<AddressModel> response =
          await _accountRepository.getAppointmentLocationByUserID();

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
