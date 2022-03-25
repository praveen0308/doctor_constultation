import 'package:dio/dio.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/models/api/doctor_detail_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/services/account_api_client.dart';
import 'package:doctor_consultation/ui/user/patient/profile/util_pages/help_us_body.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AccountRepository {
  late Dio _dio;
  late AccountApiClient _accountApiClient;
  final _storage = SecureStorage();
  AccountRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _accountApiClient = AccountApiClient(_dio);
  }
  //#region Doctor Detail
  Future<List<DoctorDetailModel>> fetchAllDoctors() {
    return _accountApiClient.fetchDoctorDetailList();
  }

  Future<DoctorDetailModel> getDoctorDetailsById(int doctorId) {
    return _accountApiClient.getDoctorDetailById(doctorId);
  }

  Future<bool> createUpdateDoctorDetail(DoctorDetailModel doctorDetailModel) {
    return _accountApiClient.addUpdateDoctorDetail(doctorDetailModel);
  }
  //#endregion

  //#region User Detail
  Future<bool> addUpdateUserDetails(UserModel userModel) {
    return _accountApiClient.addUpdateUserDetails(userModel);
  }

  Future<List<UserModel>> getAllUserDetails() {
    return _accountApiClient.getAllUserDetails();
  }

  Future<UserModel> checkLoginDetails(UserModel userModel) {
    return _accountApiClient.checkLoginDetails(userModel);
  }

  Future<UserModel> loginUser(String username, String password) {
    return _accountApiClient.checkUserLogin(username, password);
  }

  Future<List<AddressModel>> getAppointmentLocationByUserID() async {
    var userId = await _storage.getUserId();
    return _accountApiClient.getAppointmentLocationByUserID(userId);
  }

  Future<List<AddressModel>> getUserAddressByUserID() async {
    var userId = await _storage.getUserId();
    return _accountApiClient.getUserAddressByUserID(userId);
  }

  //#endregion

  //#region Subscription Plan
  Future<List<SubscriptionPlanModel>> fetchAllSubscriptionPlans() {
    return _accountApiClient.fetchSubscriptionPlanList();
  }

  Future<SubscriptionPlanModel> fetchSubscriptionPlanByID(int id) {
    return _accountApiClient.getSubscriptionPlanById(id);
  }

  Future<bool> createUpdateSubscriptionPlan(
      SubscriptionPlanModel subscriptionPlanModel) {
    return _accountApiClient.addUpdateSubscriptionPlan(subscriptionPlanModel);
  }
//#endregion
}
