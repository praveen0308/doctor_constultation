part of 'manage_slot_cubit.dart';

@immutable
abstract class ManageSlotState {}

class ManageSlotInitial extends ManageSlotState {}

class Loading extends ManageSlotState {}

class Error extends ManageSlotState {
  final String msg;

  Error(this.msg);
}

class ReceivedSlots extends ManageSlotState {
  final List<BatchModel> batches;

  ReceivedSlots(this.batches);
}
