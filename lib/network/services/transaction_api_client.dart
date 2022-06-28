import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/doctor_payment_model.dart';
import 'package:doctor_consultation/models/api/patient_subscription_model.dart';
import 'package:doctor_consultation/models/api/payment_option_model.dart';
import 'package:doctor_consultation/models/api/payment_transaction_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/models/api/user_subscription_model.dart';
import 'package:doctor_consultation/models/api/vc_payment_history_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';
part 'transaction_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class TransactionApiClient {
  factory TransactionApiClient(Dio dio, {String baseUrl}) =
      _TransactionApiClient;

  @POST("Transaction/AddUpdatePatientSubscriptionDetails")
  Future<bool> addUpdateUserSubscriptionDetails(
      @Body() PatientSubscriptionModel patientSubscriptionModel);

  //#region Video Call Payment History Service
  @GET("Transaction/GetAllVCPaymentHistory")
  Future<List<VcPaymentHistoryModel>> fetchVCPaymentHistoryList();

  @GET("Transaction/GetVCPaymentHistoryByID")
  Future<VcPaymentHistoryModel> getVCPaymentHistoryByID(@Query("ID") int id);

  @POST("Transaction/AddUpdateVCPaymentHistory")
  Future<bool> addUpdateVCPaymentHistory(
      @Body() VcPaymentHistoryModel vcPaymentHistoryModel);
//#endregion

  //#region User Subscription Service
  @GET("Transaction/GetAllUserSubscriptionDetails")
  Future<List<UserSubscriptionModel>> fetchUserSubscriptionPlanList();

  @GET("Transaction/GetUserSubscriptionDetailByID")
  Future<UserSubscriptionModel> getUserSubscriptionByID(@Query("ID") int id);

  @POST("Transaction/AddUpdateUserSubscriptionDetails")
  Future<bool> addUpdateUserSubscription(
      @Body() UserSubscriptionModel userSubscriptionModel);

  @POST("Transaction/AddUpdateUserSubscriptionDetails")
  Future<bool> updateUserSubscription(
      @Query("userID") int userID, @Query("planID") int planId);
//#endregion

  //#region Payment Option Service
  @GET("Transaction/GetAllPaymentOptDetails")
  Future<List<PaymentOptionModel>> fetchPaymentOptList();

  @GET("Transaction/GetPaymentOptDetailByID")
  Future<PaymentOptionModel> getPaymentOptByID(@Query("ID") int id);

  @POST("Transaction/AddUpdatePaymentOptDetails")
  Future<bool> addUpdatePaymentOpt(
      @Body() PaymentOptionModel paymentOptionModel);
//#endregion

  //#region Doctor Payment Detail Service
  @GET("Transaction/GetAllDoctPaymentDetails")
  Future<List<DoctorPaymentModel>> fetchDoctorPaymentList();

  @GET("Transaction/GetDoctPaymentDetailByID")
  Future<DoctorPaymentModel> getDoctorPaymentByID(@Query("ID") int id);



  @POST("Transaction/AddUpdateDoctPaymentDetails")
  Future<bool> addUpdateDoctorPayment(
      @Body() DoctorPaymentModel doctorPaymentModel);
  //#endregion

  //#region Transactions CUD
  @POST("Transaction/AddUpdatePaymentTransaction")
  Future<bool> addUpdateTransaction(@Body() PaymentTransactionModel paymentTransactionModel);


  @GET("Transaction/GetPaymentTransactionByID")
  Future<PaymentTransactionModel> getPaymentTransactionById(@Query("ID") int ID);

  @GET("Transaction/GetAllPaymentTransaction")
  Future<List<PaymentTransactionModel>> getAllTransactions();

  //#endregion
}
