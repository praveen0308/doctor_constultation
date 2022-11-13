import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/models/api/patient_subscription_model.dart';
import 'package:doctor_consultation/models/api/payment_transaction_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/models/fb_models/chat_response.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/chat_repository.dart';
import 'package:doctor_consultation/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'purchase_subscription_plan_state.dart';

class PurchaseSubscriptionPlanCubit
    extends Cubit<PurchaseSubscriptionPlanState> {
  final AccountRepository _accountRepository;
  final TransactionRepository _transactionRepository;
  final AppointmentRepository _appointmentRepository;
  final ChatRepository _chatRepository = ChatRepository();

  PurchaseSubscriptionPlanCubit(this._accountRepository,
      this._transactionRepository, this._appointmentRepository)
      : super(PurchaseSubscriptionPlanInitial());

  final String subscriptionExpiry = "";
  int paymentId = 0;
  void addNewAppointment(PatientDetailModel patientDetailModel, String description,
      int scheduleID, String date) async {
    emit(Processing("Processing..."));
    try {
      var appointmentDetailModel = AppointmentDetailModel();
      appointmentDetailModel.PatientID = patientDetailModel.ID!;
      appointmentDetailModel.Disease = description;
      appointmentDetailModel.ScheduleID = scheduleID;
      appointmentDetailModel.Date = date;

      appointmentDetailModel.AddressID = 0;
      appointmentDetailModel.DoctorID = 1;
      appointmentDetailModel.PaymentID = paymentId;

      int response = await _appointmentRepository
          .createUpdateAppointmentDetail(appointmentDetailModel);

      if (response != 0) {
        var now = DateTime.now();
        var exp = DateTime(now.year, now.month + 1, now.day);
        var chat = ChatResponse(
            userId: patientDetailModel.UserID!.toString(),
            patientId: patientDetailModel.ID!.toString(),
            expiry: exp,
            age: patientDetailModel.Age,
            gender: patientDetailModel.getGender(),
            patientName: patientDetailModel.FullName!);
        await _chatRepository.createChat(chat);
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
      if (response != null) {

        response[0].isSelected = true;

        emit(ReceivedSubscriptionPlans(response));
      } else {
        emit(Error("Failed while fetching subscription plan !!!"));
      }
      // emit(ReceivedSubscriptionPlans(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void upgradeUserSubscriptionPlan(int subscriptionId, int patientId) async {
    emit(Processing("Processing..."));
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

  void addPaymentTransaction(String paymentID, String orderId,double amount,int appointmentID,int patientId) async {
    emit(Processing("Processing..."));
    try {
      PaymentTransactionModel paymentTransactionModel = PaymentTransactionModel();
      paymentTransactionModel.PaymentID = paymentID;
      paymentTransactionModel.OrderID = orderId;
      paymentTransactionModel.ID = 0;
      paymentTransactionModel.PaymentAmount = amount;
      paymentTransactionModel.PatientID = patientId;
      paymentTransactionModel.CaseID = appointmentID;
      paymentTransactionModel.Status = "PAID";
      paymentTransactionModel.Message = "Appointment Booking";
      paymentTransactionModel.RefundReason = "";
      paymentTransactionModel.RefundAmount = 0;
      paymentTransactionModel.IsPaid = true;
      paymentTransactionModel.IsRefunded = false;
      paymentTransactionModel.IsCancel = false;


      int response = await _transactionRepository
          .addUpdatePaymentTransaction(paymentTransactionModel);
      if (response!=0) {
        paymentId = response;
        emit(TransactionAddedSuccessfully(response));
      } else {
        emit(Error("Transaction update failed!!!"));
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
