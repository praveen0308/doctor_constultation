import 'package:dio/dio.dart';
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

  Future<bool> createUpdateCaseInfo(CaseInfoModel caseInfoModel) {
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
//#endregion
}
