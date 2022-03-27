import 'package:dio/dio.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/network/services/patient_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PatientRepository {
  late Dio _dio;
  late PatientApiClient _patientApiClient;
  final _storage = SecureStorage();
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

  Future<List<PatientDetailModel>> fetchPatientByID({int userId = 0}) async {
    if (userId == 0) userId = await _storage.getUserId();
    return _patientApiClient.getPatientDetailByID(userId);
  }

  Future<PatientDetailModel> getPatientDetailsByPatientId(int patientID) async {
    return _patientApiClient.getPatientDetailByPatientID(patientID);
  }

  Future<int> createUpdatePatientDetail(
      PatientDetailModel patientDetailModel) async {
    patientDetailModel.UserID = await _storage.getUserId();
    return _patientApiClient.addUpdatePatientDetail(patientDetailModel);
  }

  Future<bool> createUpdateUserAddress(AddressModel addressModel) async {
    addressModel.AddedBy = await _storage.getUserId();
    addressModel.UserID = await _storage.getUserId();
    return _patientApiClient.addUpdateUserAddress(addressModel);
  }
//#endregion
}
