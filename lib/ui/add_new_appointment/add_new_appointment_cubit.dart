import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:doctor_consultation/repository/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_new_appointment_state.dart';

class AddNewAppointmentCubit extends Cubit<AddNewAppointmentState> {
  final AppointmentRepository _appointmentRepository;
  final AccountRepository _accountRepository;
  AddNewAppointmentCubit(this._appointmentRepository, this._accountRepository)
      : super(AddNewAppointmentInitial());

  ScheduleModel? slot;
  PatientDetailModel? patientDetailModel;

  int selectedLocationId = 0;
  String problemDescription = "";
  bool validateAppointment() {
    bool isValid = false;
    if (slot != null) {
      if (patientDetailModel != null) {
        isValid = true;
      } else {
        emit(AddNewAppointmentError("Add a patient record!!!"));
      }
    } else {
      emit(AddNewAppointmentError("Select slot!!!"));
    }

    return isValid;
  }

  /*void addNewAppointment() async {
    emit(AddingNewAppointment());
    try {
      var appointmentDetailModel = AppointmentDetailModel();
      if (selectedPatientId != null) {
        appointmentDetailModel.PatientID = selectedPatientId;
      } else {
        emit(AddNewAppointmentError("Add a patient record!!!"));
      }

      appointmentDetailModel.AddressID = selectedLocationId;
      appointmentDetailModel.DoctorID = 1;
      appointmentDetailModel.Disease = problemDescription;

      if (slot != null) {
        appointmentDetailModel.ScheduleID = slot!.ScheduleID!;
        appointmentDetailModel.Date = slot!.ScheduleDate!;
      } else {
        emit(AddNewAppointmentError("Select slot!!!"));
      }

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
  }*/

  void getSubscriptionPlanByLocation() async {
    emit(LoadingSubscriptionPlan());
    try {
      SubscriptionPlanModel response =
          await _accountRepository.getSubscriptionPlanByLocation("400072");

      if (response != null) {
        emit(ReceivedSubscriptionPlan(response));
      } else {
        emit(FetchingSubscriptionFailed(
            "Failed while fetching subscription plan !!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(FetchingSubscriptionFailed("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(FetchingSubscriptionFailed("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
