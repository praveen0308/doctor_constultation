import 'package:dio/dio.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/doctor_payment_model.dart';
import 'package:doctor_consultation/models/api/patient_subscription_model.dart';
import 'package:doctor_consultation/models/api/payment_option_model.dart';
import 'package:doctor_consultation/models/api/payment_transaction_model.dart';
import 'package:doctor_consultation/models/api/user_subscription_model.dart';
import 'package:doctor_consultation/models/api/vc_payment_history_model.dart';
import 'package:doctor_consultation/network/services/transaction_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TransactionRepository {
  late Dio _dio;
  late TransactionApiClient _transactionApiClient;
  final _storage = SecureStorage();
  TransactionRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _transactionApiClient = TransactionApiClient(_dio);
  }

  Future<bool> addUpdateSubscriptionModel(
      PatientSubscriptionModel patientSubscriptionModel) {
    return _transactionApiClient
        .addUpdateUserSubscriptionDetails(patientSubscriptionModel);
  }

  //#region Video Call Payment History Repo
  Future<List<VcPaymentHistoryModel>> fetchAllVCPaymentHistory() {
    return _transactionApiClient.fetchVCPaymentHistoryList();
  }

  Future<VcPaymentHistoryModel> fetchVCPaymentHistoryByID(int id) {
    return _transactionApiClient.getVCPaymentHistoryByID(id);
  }

  Future<bool> createUpdateVCPaymentHistoryDetail(
      VcPaymentHistoryModel vcPaymentHistoryModel) {
    return _transactionApiClient
        .addUpdateVCPaymentHistory(vcPaymentHistoryModel);
  }
//#endregion

  //#region User Subscription Repo
  Future<List<UserSubscriptionModel>> fetchAllUserSubscription() {
    return _transactionApiClient.fetchUserSubscriptionPlanList();
  }

  Future<UserSubscriptionModel> fetchUserSubscriptionByID(int id) {
    return _transactionApiClient.getUserSubscriptionByID(id);
  }

  Future<bool> createUpdateUserSubscriptionDetail(
      UserSubscriptionModel userSubscriptionModel) {
    return _transactionApiClient
        .addUpdateUserSubscription(userSubscriptionModel);
  }

  Future<bool> updateUserSubscriptionDetail(int subscriptionPlanId) async {
    int userId = await _storage.getUserId();
    return _transactionApiClient.updateUserSubscription(
        userId, subscriptionPlanId);
  }
  //#endregion

  //#region Payment Option Repo
  Future<List<PaymentOptionModel>> fetchAllPaymentOption() {
    return _transactionApiClient.fetchPaymentOptList();
  }

  Future<PaymentOptionModel> fetchPaymentOptionByID(int id) {
    return _transactionApiClient.getPaymentOptByID(id);
  }

  Future<bool> createUpdatePaymentOptionDetail(
      PaymentOptionModel paymentOptionModel) {
    return _transactionApiClient.addUpdatePaymentOpt(paymentOptionModel);
  }
//#endregion

  //#region Doctor Payment History Repo
  Future<List<DoctorPaymentModel>> fetchAllDoctorPaymentHistory() {
    return _transactionApiClient.fetchDoctorPaymentList();
  }

  Future<DoctorPaymentModel> fetchDoctorPaymentHistoryByID(int id) {
    return _transactionApiClient.getDoctorPaymentByID(id);
  }

  Future<bool> createUpdateDoctorPaymentDetail(
      DoctorPaymentModel doctorPaymentModel) {
    return _transactionApiClient.addUpdateDoctorPayment(doctorPaymentModel);
  }
//#endregion

//#region Transactions
  Future<int> addUpdatePaymentTransaction(PaymentTransactionModel paymentTransactionModel) async {
    int userId = await _storage.getUserId();
    paymentTransactionModel.UserID = userId;
    return _transactionApiClient.addUpdateTransaction(paymentTransactionModel);
  }

  Future<PaymentTransactionModel> getPaymentTransactionByID(int id) {
    return _transactionApiClient.getPaymentTransactionDetailByID(id);
  }

  Future<List<PaymentTransactionModel>> getPaymentTransactions() {
    return _transactionApiClient.getAllTransactions();
  }
//#endregion

}
