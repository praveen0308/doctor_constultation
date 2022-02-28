import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'patient_appointment_history_state.dart';

class PatientAppointmentHistoryCubit
    extends Cubit<PatientAppointmentHistoryState> {
  final AppointmentRepository _appointmentRepository;
  PatientAppointmentHistoryCubit(this._appointmentRepository)
      : super(AppointmentHistoryInitial());

  void fetchAppointHistory() async {
    emit(Loading());
    try {
      List<AppointmentDetailModel> response =
          await _appointmentRepository.fetchAllAppointmentDetailsByUserId();
      if (response.isNotEmpty) {
        emit(ReceivedAppointmentHistory(response));
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
}
