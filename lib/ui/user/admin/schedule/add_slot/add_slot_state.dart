part of 'add_slot_cubit.dart';

@immutable
abstract class AddSlotState {}

class AddSlotInitial extends AddSlotState {}

class Loading extends AddSlotState {}

class Success extends AddSlotState {
}

class Error extends AddSlotState {
  final String msg;
  Error(this.msg);
}
