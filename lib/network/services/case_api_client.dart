import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/case_doc_model.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';

part 'case_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CaseApiClient {
  factory CaseApiClient(Dio dio, {String baseUrl}) = _CaseApiClient;

  //#region Case Info Detail Service
  @GET("Case/GetAllCaseInfoDetails")
  Future<List<CaseInfoModel>> fetchCaseInfoDetailList();

  @GET("Case/GetCaseInfoDetailByID")
  Future<CaseInfoModel> getCaseInfoDetailByID(@Query("ID") int id);

  @POST("Case/AddUpdateCaseInfoDetail")
  Future<int> addUpdateCaseInfoDetail(@Body() CaseInfoModel caseInfoModel);

  @GET("Case/GetCaseDetailsByPatientID")
  Future<List<CaseInfoModel>> getCaseDetailsByPatientID(
      @Query("PatientID") int patientId);
  //#endregion

  //#region Case Doc Detail Service
  @GET("Case/GetAllCaseDocDetails")
  Future<List<CaseDocModel>> fetchCaseDocDetailList();

  @GET("Case/GetCaseDoctDetailByID")
  Future<CaseDocModel> getCaseDocDetailByID(@Query("ID") int id);

  @GET("Case/GetCaseAttachmentsByCaseID")
  Future<List<CaseDocModel>> getCaseAttachmentsByCaseId(@Query("CaseID") int caseID);

  @POST("Case/AddUpdateCaseDocDetail")
  Future<bool> addUpdateCaseDocDetail(@Body() CaseDocModel caseDocModel);

  @POST("Case/CaseDocumentUpload")
  Future<String> uploadCaseDocument(@Body() FormData formData);
//#endregion
}
