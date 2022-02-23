import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';

part 'patient_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PatientApiClient {
  factory PatientApiClient(Dio dio, {String baseUrl}) = _PatientApiClient;

  //#region Patient Detail Service
  @GET("Patient/GetAllPatientDetails")
  Future<List<PatientDetailModel>> fetchPatientDetailList();

  @GET("Patient/GetPatientDetailByUserID")
  Future<List<PatientDetailModel>> getPatientDetailByID(
      @Query("UserID") int userId);

  @POST("Patient/AddUpdatePatientDetails")
  Future<bool> addUpdatePatientDetail(
      @Body() PatientDetailModel patientDetailModel);
//#endregion
}
