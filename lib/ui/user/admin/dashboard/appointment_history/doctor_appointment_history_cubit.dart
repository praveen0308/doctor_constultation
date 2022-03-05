import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'doctor_appointment_history_state.dart';

class DoctorAppointmentHistoryCubit
    extends Cubit<DoctorAppointmentHistoryState> {
  final AppointmentRepository _appointmentRepository;

  DoctorAppointmentHistoryCubit(this._appointmentRepository)
      : super(DoctorAppointmentHistoryInitial());
  late String selectedDate;
  void getAppointmentsByDate(String date) async {
    selectedDate = date;
    emit(Loading());
    try {
      List<AppointmentDetailModel> response =
          await _appointmentRepository.fetchAllAppointmentDetailsByDate(selectedDate);

      emit(ReceivedAppointments(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void startSession(int appointmentId) async {
    emit(StartingSession());
    try {
      bool response = await _appointmentRepository.updateAppointmentStatus(appointmentId,AppConstants.ongoing);
      if(response){
        emit(SessionStarted());
        getAppointmentsByDate(selectedDate);

      }else{
        emit(Error("Failed to start session!!!"));
      }

    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void cancelAppointment(int appointmentId) async {
    emit(CancellingAppointment());
    try {
      bool response = await _appointmentRepository.updateAppointmentStatus(appointmentId,AppConstants.cancelled);
      if(response){

        emit(AppointmentCancelled());
        getAppointmentsByDate(selectedDate);
      }else{
        emit(Error("Failed!!"));
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
