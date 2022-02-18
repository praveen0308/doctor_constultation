import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/services/patient_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PatientRepository {
  late Dio _dio;
  late PatientApiClient _patientApiClient;

  PatientRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _patientApiClient = PatientApiClient(_dio);
  }
  //#region Patient Repo
  Future<List<PatientDetailModel>> fetchAllPatient() {
    return _patientApiClient.fetchPatientDetailList();
  }

  Future<PatientDetailModel> fetchPatientByID(int id) {
    return _patientApiClient.getPatientDetailByID(id);
  }

  Future<bool> createUpdatePatientDetail(PatientDetailModel patientDetailModel) {
    return _patientApiClient.addUpdatePatientDetail(patientDetailModel);
  }
//#endregion
}