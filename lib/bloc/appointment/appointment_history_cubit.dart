import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../network/utils/network_exceptions.dart';

part 'appointment_history_state.dart';

class AppointmentHistoryCubit extends Cubit<AppointmentHistoryState> {
  final AppointmentRepository _appointmentRepository;
  AppointmentHistoryCubit(this._appointmentRepository) : super(AppointmentHistoryInitial());

  void fetchAppointHistory(int userId) async {
    emit(Loading());
    try {
      List<AppointmentDetailModel> response = await _appointmentRepository.fetchAllAppointmentDetails(userId);

      emit(ReceivedAppointHistory(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
