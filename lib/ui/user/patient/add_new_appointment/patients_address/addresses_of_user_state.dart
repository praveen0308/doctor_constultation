part of 'addresses_of_user_cubit.dart';

@immutable
abstract class AddressesOfUserState {}

class AddressesOfUserInitial extends AddressesOfUserState {}

class Loading extends AddressesOfUserState {}

class Error extends AddressesOfUserState {
  final String msg;
  Error(this.msg);
}

class ReceivedAddressList extends AddressesOfUserState {
  final List<AddressModel> addresses;
  ReceivedAddressList(this.addresses);
}
