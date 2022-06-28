import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/schedule_repository.dart';
import 'package:flutter/material.dart';

part 'appointment_available_slots_state.dart';

class AppointmentAvailableSlotsCubit
    extends Cubit<AppointmentAvailableSlotsState> {
  final ScheduleRepository _scheduleRepository;
  AppointmentAvailableSlotsCubit(this._scheduleRepository)
      : super(AppointmentAvailableSlotsInitial());

  void fetchSlotsByDate(String date) async {
    emit(Loading());
    try {
      List<ScheduleModel> response =
          await _scheduleRepository.getAvailableSlotsByDate(date);
      emit(ReceivedAvailableSlots(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
