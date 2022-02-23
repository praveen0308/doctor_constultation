part of 'create_new_schedule_cubit.dart';

@immutable
abstract class CreateNewScheduleState {}

class CreateNewScheduleInitial extends CreateNewScheduleState {}

class Loading extends CreateNewScheduleState {}

class Error extends CreateNewScheduleState {
  final String msg;

  Error(this.msg);
}

class ReceivedSlots extends CreateNewScheduleState {
  final List<BatchModel> batches;

  ReceivedSlots(this.batches);
}
