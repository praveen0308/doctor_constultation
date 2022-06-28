import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../network/utils/network_exceptions.dart';

part 'user_appointments_state.dart';

class UserAppointmentsCubit extends Cubit<UserAppointmentsState> {
  final AppointmentRepository _appointmentRepository;
  UserAppointmentsCubit(this._appointmentRepository) : super(UserAppointmentsInitial());

  void fetchAppointHistory(int userId) async {
    emit(Loading());
    try {
      List<AppointmentDetailModel> response =
      await _appointmentRepository.getAppointmentsByUserId(userId);

      if (response.isNotEmpty) {

        emit(ReceivedAppointments(response.reversed.toList()));
      } else {
        emit(NoAppointmentHistory());
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
    emit(Loading());
    try {
      bool response = await _appointmentRepository.updateAppointmentStatus(
          appointmentId, AppConstants.cancelled);
      if (response) {
        emit(AppointmentCancelled());

      } else {
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

  void startSession(int appointmentId, String meetingID) async {
    emit(StartingSession());
    try {
      bool response = await _appointmentRepository.updateAppointmentStatus(
          appointmentId, AppConstants.ongoing,
          meetingId: meetingID);
      if (response) {
        emit(SessionStarted());

      } else {
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
}
