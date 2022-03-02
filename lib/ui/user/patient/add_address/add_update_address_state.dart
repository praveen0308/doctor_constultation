part of 'add_update_address_cubit.dart';

@immutable
abstract class AddUpdateAddressState {}

class AddUpdateAddressInitial extends AddUpdateAddressState {}

class Loading extends AddUpdateAddressState {}

class Error extends AddUpdateAddressState {
  final String msg;
  Error(this.msg);
}

class AddressAddedSuccessfully extends AddUpdateAddressState {}
