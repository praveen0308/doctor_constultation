import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../local/app_storage.dart';
import '../../../../../models/api/appointment_detail_model.dart';
import '../../../../../network/utils/network_exceptions.dart';
import '../../../../../repository/appointment_repository.dart';
import '../../../../../util/app_constants.dart';
import '../../../../../util/date_time_helper.dart';

part 'current_day_appointment_state.dart';

class CurrentDayAppointmentCubit extends Cubit<CurrentDayAppointmentState> {
  final AppointmentRepository _appointmentRepository;
  final _storage =SecureStorage();
  CurrentDayAppointmentCubit(this._appointmentRepository) : super(CurrentDayAppointmentInitial());

  void getAppointmentsByDate() async {
    emit(LoadingAppointments());
    try {
      List<int>? noOfAppointments = await _storage.getNoOfAppointments();

      if(noOfAppointments!=null){
        emit(ReceivedCachedAppointments(noOfAppointments));


      }
      List<AppointmentDetailModel> response = await _appointmentRepository.fetchAllAppointmentDetailsByDate(DateTimeHelper.getCurrentDate(format: "yyyy-MM-dd"));
      var ra = ReceivedAppointments(response);
      _storage.updateNoOfAppointments(ra.total, ra.remaining, ra.completed);
      ra.calculateAppointments();
      emit(ra);


    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

}
