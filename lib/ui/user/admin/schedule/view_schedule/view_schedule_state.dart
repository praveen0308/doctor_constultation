part of 'view_schedule_cubit.dart';

@immutable
abstract class ViewScheduleState {}

class ViewScheduleInitial extends ViewScheduleState {}

class Loading extends ViewScheduleState {}

class Error extends ViewScheduleState {
  final String msg;

  Error(this.msg);
}

class ReceivedAvailableSlots extends ViewScheduleState {
  final List<ScheduleModel> slots;

  ReceivedAvailableSlots(this.slots);
}

class ReceivedBatches extends ViewScheduleState {
  final List<BatchModel> batches;

  ReceivedBatches(this.batches);
}
