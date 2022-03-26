import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/patient_subscription_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'purchase_subscription_plan_state.dart';

class PurchaseSubscriptionPlanCubit
    extends Cubit<PurchaseSubscriptionPlanState> {
  final AccountRepository _accountRepository;
  final TransactionRepository _transactionRepository;
  final AppointmentRepository _appointmentRepository;
  PurchaseSubscriptionPlanCubit(this._accountRepository,
      this._transactionRepository, this._appointmentRepository)
      : super(PurchaseSubscriptionPlanInitial());
  void addNewAppointment(
      int patientID, String description, int scheduleID, String date) async {
    emit(Loading());
    try {
      var appointmentDetailModel = AppointmentDetailModel();
      appointmentDetailModel.PatientID = patientID;
      appointmentDetailModel.Disease = description;
      appointmentDetailModel.ScheduleID = scheduleID;
      appointmentDetailModel.Date = date;

      appointmentDetailModel.AddressID = 0;
      appointmentDetailModel.DoctorID = 1;

      int response = await _appointmentRepository
          .createUpdateAppointmentDetail(appointmentDetailModel);

      if (response != 0) {
        emit(AppointmentAddedSuccessfully(response));
      } else {
        emit(AddAppointmentFailed());
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void getSubscriptionPlans() async {
    emit(Loading());
    try {
      List<SubscriptionPlanModel> response =
          await _accountRepository.fetchAllSubscriptionPlans();

      emit(ReceivedSubscriptionPlans(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void upgradeUserSubscriptionPlan(int subscriptionId, int patientId) async {
    emit(Loading());
    try {
      PatientSubscriptionModel subscriptionModel = PatientSubscriptionModel();
      subscriptionModel.PatientID = patientId;
      subscriptionModel.SubscriptionID = subscriptionId;
      bool response = await _transactionRepository
          .addUpdateSubscriptionModel(subscriptionModel);
      if (response) {
        emit(PlanUpdatedSuccessfully());
      } else {
        emit(Error("Plan update failed!!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void getSubscriptionPlanByLocation() async {
    emit(Loading());
    try {
      SubscriptionPlanModel response =
          await _accountRepository.getSubscriptionPlanByLocation("400072");

      if (response != null) {
        response.isSelected = true;
        List<SubscriptionPlanModel> plans = [];
        plans.add(response);
        emit(ReceivedSubscriptionPlans(plans));
      } else {
        emit(Error("Failed while fetching subscription plan !!!"));
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
