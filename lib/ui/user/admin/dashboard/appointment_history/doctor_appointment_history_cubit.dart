import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'doctor_appointment_history_state.dart';

class DoctorAppointmentHistoryCubit
    extends Cubit<DoctorAppointmentHistoryState> {
  final AppointmentRepository _appointmentRepository;

  DoctorAppointmentHistoryCubit(this._appointmentRepository)
      : super(DoctorAppointmentHistoryInitial());

  void getAppointmentsByDate(String date) async {
    emit(Loading());
    try {
      List<AppointmentDetailModel> response =
          await _appointmentRepository.fetchAllAppointmentDetailsByDate(date);

      emit(ReceivedAppointments(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
