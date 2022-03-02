import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:flutter/material.dart';
part 'add_update_address_state.dart';

class AddUpdateAddressCubit extends Cubit<AddUpdateAddressState> {
  final PatientRepository _patientRepository;
  AddUpdateAddressCubit(this._patientRepository)
      : super(AddUpdateAddressInitial());

  void addNewAddress(AddressModel patientAddressModel) async {
    emit(Loading());
    try {
      bool response =
          await _patientRepository.createUpdateUserAddress(patientAddressModel);
      if (response) {
        emit(AddressAddedSuccessfully());
      } else {
        emit(Error("Failed !!!"));
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
