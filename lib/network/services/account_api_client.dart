import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/doctor_detail_model.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';

part 'account_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AccountApiClient {
  factory AccountApiClient(Dio dio, {String baseUrl}) = _AccountApiClient;
  @GET("Account/GetDoctorDetailsByID")
  Future<DoctorDetailModel> getDoctorDetailsById(
      @Query("DoctorID") int doctorId);

  @POST("Account/AddUpdateUserDetails")
  Future<bool> addUpdateUserDetails(@Body() UserModel userModel);

  @POST("Account/CheckLoginDetails")
  Future<UserModel> checkLoginDetails(
      @Query("UserName") String userName, @Query("Password") String password);
}
