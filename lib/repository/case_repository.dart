import 'package:dio/dio.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/case_doc_model.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/network/services/case_api_client.dart';

import 'package:doctor_consultation/network/utils/dio_client.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CaseRepository {
  late Dio _dio;
  late CaseApiClient _caseApiClient;
  final _storage = SecureStorage();

  CaseRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _caseApiClient = CaseApiClient(_dio);
  }

  //#region Case Info Repo
  Future<List<CaseInfoModel>> fetchAllCaseInfo() {
    return _caseApiClient.fetchCaseInfoDetailList();
  }

  Future<CaseInfoModel> fetchCaseInfoByID(int id) {
    return _caseApiClient.getCaseInfoDetailByID(id);
  }

  Future<List<CaseInfoModel>> getCaseHistoryByPatientID(int patientId) {
    return _caseApiClient.getCaseDetailsByPatientID(patientId);
  }

  Future<int> createUpdateCaseInfo(CaseInfoModel caseInfoModel) {
    return _caseApiClient.addUpdateCaseInfoDetail(caseInfoModel);
  }
//#endregion

  //#region Case Doc Repo
  Future<List<CaseDocModel>> fetchAllCaseDoc() {
    return _caseApiClient.fetchCaseDocDetailList();
  }

  Future<CaseDocModel> fetchCaseDocByID(int id) {
    return _caseApiClient.getCaseDocDetailByID(id);
  }

  Future<bool> createUpdateCaseDoc(CaseDocModel caseDocModel) {
    return _caseApiClient.addUpdateCaseDocDetail(caseDocModel);
  }

  Future<String> uploadCaseDocument(
      int caseInfoId, String comment, String path, String fileName) async {
    int userId = await _storage.getUserId();
    var formData = FormData();
    formData.fields.add(MapEntry("CaseInfoID", caseInfoId.toString()));
    formData.fields.add(MapEntry("UserID", userId.toString()));
    formData.fields.add(MapEntry("Comment", comment));

    formData.files.add(MapEntry(
      "Document",
      await MultipartFile.fromFile(path, filename: fileName),
    ));
    return _caseApiClient.uploadCaseDocument(formData);
  }
//#endregion
}
