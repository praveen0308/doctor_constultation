import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/doctor_detail_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/services/account_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AccountRepository {
  late Dio _dio;
  late AccountApiClient _accountApiClient;

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

  Future<UserModel> checkLoginDetails(UserModel userModel) {
    return _accountApiClient.checkLoginDetails(userModel);
  }

  Future<UserModel> loginUser(String username, String password) {
    return _accountApiClient.checkUserLogin(username, password);
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
