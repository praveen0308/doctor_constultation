import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/doctor_detail_model.dart';
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

  Future<bool> addUpdateUserDetails(UserModel userModel) {
    return _accountApiClient.addUpdateUserDetails(userModel);
  }

  Future<UserModel> checkLoginDetails(int doctorId) {
    throw UnimplementedError();
  }

  Future<DoctorDetailModel> getDoctorDetailsById(int doctorId) {
    throw UnimplementedError();
  }
}
