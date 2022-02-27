import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:doctor_consultation/repository/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_new_appointment_state.dart';

class AddNewAppointmentCubit extends Cubit<AddNewAppointmentState> {
  final AppointmentRepository _appointmentRepository;
  AddNewAppointmentCubit(this._appointmentRepository)
      : super(AddNewAppointmentInitial());

  /* void fetchSlotsByDate(String date) async {
    emit(LoadingAvailableSlots());
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
*/
  void addNewAppointment(AppointmentDetailModel appointmentDetailModel) async {
    emit(LoadingAvailableSlots());
    try {
      bool response = await _appointmentRepository
          .createUpdateAppointmentDetail(appointmentDetailModel);

      if (response) {
        emit(AppointmentAddedSuccessfully());
      } else {
        emit(AddAppointmentFailed());
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
