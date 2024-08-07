import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/models/batch_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'manage_slot_state.dart';

class ManageSlotCubit extends Cubit<ManageSlotState> {
  final AppointmentRepository _appointmentRepository;

  ManageSlotCubit(this._appointmentRepository) : super(ManageSlotInitial());

  void fetchSlotsByDayId(int id) async {
    emit(Loading());
    try {
      List<SlotModel> response =
          await _appointmentRepository.fetchAllSlotDetail(dayId: id);

      List<BatchModel> batches = DateTimeHelper.getBatches();
      for (var batch in batches) {
        for (var slot in response) {
          if (batch.id == slot.BatchID) {
            batch.slots.add(slot);
          }
        }
      }

      emit(ReceivedSlots(batches));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
