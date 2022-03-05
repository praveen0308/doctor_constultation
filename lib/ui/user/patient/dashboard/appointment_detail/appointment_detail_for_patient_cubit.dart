import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';

part 'appointment_detail_for_patient_state.dart';

class AppointmentDetailForPatientCubit extends Cubit<AppointmentDetailForPatientState> {
  final AppointmentRepository _appointmentRepository;
  AppointmentDetailForPatientCubit(this._appointmentRepository) : super(AppointmentDetailForPatientInitial());
  void getAppointmentDetail(int appointmentId) async {

    emit(LoadingAppointmentDetail());
    try {
      AppointmentDetailModel response =
      await _appointmentRepository.fetchAppointmentDetailByID(appointmentId);

      emit(ReceivedAppointmentDetail(response));
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
