part of 'create_new_schedule_cubit.dart';

@immutable
abstract class CreateNewScheduleState {}

class CreateNewScheduleInitial extends CreateNewScheduleState {}

class Loading extends CreateNewScheduleState {}

class SubmittingSlots extends CreateNewScheduleState {}

class Error extends CreateNewScheduleState {
  final String msg;

  Error(this.msg);
}

class ReceivedSlots extends CreateNewScheduleState {
  final List<SlotModel> slots;
  ReceivedSlots(this.slots);
}

class SubmissionSuccess extends CreateNewScheduleState {}

class SubmissionFailure extends CreateNewScheduleState {}
