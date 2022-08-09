import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/models/batch_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/schedule_repository.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../models/api/schedule_model.dart';

part 'create_new_schedule_state.dart';

class CreateNewScheduleCubit extends Cubit<CreateNewScheduleState> {
  final AppointmentRepository _appointmentRepository;
  final ScheduleRepository _scheduleRepository;

  CreateNewScheduleCubit(this._appointmentRepository, this._scheduleRepository)
      : super(CreateNewScheduleInitial());

  void fetchSlotsByDayId(int id,List<ScheduleModel> schedules) async {
    emit(Loading());
    try {
      List<SlotModel> response =
          await _appointmentRepository.fetchAllSlotDetail(dayId: id);

      response.forEach((slot) {
        slot.IsAvailable = false;
        schedules.forEach((element) {
          if(slot.getTiming()==element.getTiming()) {
            slot.IsDisabled = true;
          }
        });
      });
      emit(ReceivedSlots(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void submitSlots(String date, List<int> slots) async {
    emit(SubmittingSlots());
    try {
      bool response = await _scheduleRepository.addScheduleDetails(date, slots);
      if (response) {
        emit(SubmissionSuccess());
      } else {
        emit(SubmissionFailure());
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
