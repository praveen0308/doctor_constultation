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

  late ScheduleModel slot;
  late int selectedPatientId;
  late String problemDescription;

  void addNewAppointment() async {
    emit(AddingNewAppointment());
    try {
      var appointmentDetailModel = AppointmentDetailModel();
      appointmentDetailModel.PatientID = selectedPatientId;
      appointmentDetailModel.DoctorID = 1;
      appointmentDetailModel.Disease = problemDescription;
      appointmentDetailModel.ScheduleID = slot.ScheduleID!;
      appointmentDetailModel.Date = slot.ScheduleDate!;
      bool response = await _appointmentRepository
          .createUpdateAppointmentDetail(appointmentDetailModel);

      if (response) {
        emit(AppointmentAddedSuccessfully());
      } else {
        emit(AddAppointmentFailed());
      }
    } on NetworkExceptions catch (e) {
      emit(AddNewAppointmentError("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(AddNewAppointmentError("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
