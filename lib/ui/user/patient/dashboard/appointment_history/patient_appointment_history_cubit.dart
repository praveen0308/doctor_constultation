import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'patient_appointment_history_state.dart';

class PatientAppointmentHistoryCubit
    extends Cubit<PatientAppointmentHistoryState> {
  final AppointmentRepository _appointmentRepository;
  PatientAppointmentHistoryCubit(this._appointmentRepository)
      : super(AppointmentHistoryInitial());
  final List<AppointmentDetailModel> appointments = [];
  void fetchAppointHistory() async {
    emit(Loading());
    try {
      List<AppointmentDetailModel> response =
          await _appointmentRepository.fetchAllAppointmentDetailsByUserId();
      appointments.clear();
      appointments.addAll(response);
      if (response.isNotEmpty) {
        filterAppointment(0);
        // emit(ReceivedAppointmentHistory(response));
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
        fetchAppointHistory();
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

  void filterAppointment(int status) {
    final List<AppointmentDetailModel> result = [];
    for (var item in appointments) {
      switch (status) {
        case 0:
          {
            if (item.AppointmentStatusID != AppConstants.closed &&
                item.AppointmentStatusID != AppConstants.cancelled) {
              result.add(item);
            }
          }
          break;
        case 1:
          {
            if (item.AppointmentStatusID == AppConstants.closed) {
              result.add(item);
            }
          }
          break;
        case 2:
          {
            if (item.AppointmentStatusID == AppConstants.cancelled) {
              result.add(item);
            }
          }
          break;
      }
    }

    emit(ReceivedAppointmentHistory(result));
  }
}
