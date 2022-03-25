import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/models/api/doctor_detail_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';

part 'account_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AccountApiClient {
  factory AccountApiClient(Dio dio, {String baseUrl}) = _AccountApiClient;
  //#region Doctor Detail
  @GET("Account/GetAllDoctorDetails")
  Future<List<DoctorDetailModel>> fetchDoctorDetailList();

  @GET("Account/GetDoctorDetailByID")
  Future<DoctorDetailModel> getDoctorDetailById(
      @Query("DoctorID") int doctorId);

  @POST("Account/AddUpdateDoctorDetail")
  Future<bool> addUpdateDoctorDetail(
      @Body() DoctorDetailModel doctorDetailModel);

  //#endregion
  //#region User Details
  @POST("Account/AddUpdateUserDetails")
  Future<bool> addUpdateUserDetails(@Body() UserModel userModel);

  @GET("Account/GetAllUserDetails")
  Future<List<UserModel>> getAllUserDetails();

  @POST("Account/CheckLoginDetails")
  Future<UserModel> checkLoginDetails(@Body() UserModel userModel);

  @POST("Account/CheckLoginDetails")
  Future<UserModel> checkUserLogin(
      @Query("username") String username, @Query("password") String password);

  @GET("Account/GetAppointmentLocationByUserID")
  Future<List<AddressModel>> getAppointmentLocationByUserID(
      @Query("UserID") int userId);

  @GET("Account/GetUserAddressByUserID")
  Future<List<AddressModel>> getUserAddressByUserID(
      @Query("UserID") int userId);
  //#endregion

  //#region Subscription Plan
  @GET("Account/GetAllSubscriptionPlanDetails")
  Future<List<SubscriptionPlanModel>> fetchSubscriptionPlanList();

  @GET("Account/GetSubscriptionPlanDetailByID")
  Future<SubscriptionPlanModel> getSubscriptionPlanById(
      @Query("SubscriptionID") int subscriptionID);

  @POST("Account/AddUpdateSubscriptionPlanDetail")
  Future<bool> addUpdateSubscriptionPlan(
      @Body() SubscriptionPlanModel subscriptionPlanModel);
  //#endregion
}
