part of 'add_discount_cubit.dart';

@immutable
abstract class AddDiscountState {}

class AddDiscountInitial extends AddDiscountState {}
class Loading extends AddDiscountState {}
class AddedSuccessfully extends AddDiscountState {}
class Error extends AddDiscountState {
  final String msg;

  Error(this.msg);
}
