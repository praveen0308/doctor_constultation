part of 'user_addresses_cubit.dart';

@immutable
abstract class UserAddressesState {}

class UserAddressesInitial extends UserAddressesState {}

class Loading extends UserAddressesState {}

class NoAddresses extends UserAddressesState {}

class Error extends UserAddressesState {
  final String msg;

  Error(this.msg);
}

class ReceivedAddressList extends UserAddressesState {
  final List<AddressModel> addressList;

  ReceivedAddressList(this.addressList);
}
