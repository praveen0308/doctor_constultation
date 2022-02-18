import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/dosage_model.dart';
import 'package:doctor_consultation/models/api/medicine_model.dart';
import 'package:doctor_consultation/models/api/medicine_prescribed_model.dart';
import 'package:doctor_consultation/models/api/prescription_medicine_model.dart';
import 'package:doctor_consultation/models/api/prescription_model.dart';
import 'package:doctor_consultation/network/services/medicine_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MedicineRepository {
  late Dio _dio;
  late MedicineApiClient _medicineApiClient;

  MedicineRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _medicineApiClient = MedicineApiClient(_dio);
  }
  //#region Prescription Repo
  Future<List<PrescriptionModel>> fetchAllPrescription() {
    return _medicineApiClient.fetchPrescriptionDetailList();
  }

  Future<PrescriptionModel> fetchPrescriptionByID(int id) {
    return _medicineApiClient.getPrescriptionDetailByID(id);
  }

  Future<bool> createUpdatePrescriptionDetail(PrescriptionModel prescriptionModel) {
    return _medicineApiClient.addUpdatePrescriptionDetail(prescriptionModel);
  }
//#endregion

  //#region Prescription Medicine Repo
  Future<List<PrescriptionMedicineModel>> fetchAllPrescriptionMedicine() {
    return _medicineApiClient.fetchPrescriptionMedicineDetailList();
  }

  Future<PrescriptionMedicineModel> fetchPrescriptionMedicineByID(int id) {
    return _medicineApiClient.getPrescriptionMedicineByID(id);
  }

  Future<bool> createUpdatePrescriptionMedicineDetail(PrescriptionMedicineModel prescriptionMedicineModel) {
    return _medicineApiClient.addUpdatePrescriptionMedicineDetail(prescriptionMedicineModel);
  }
//#endregion

  //#region Medicine Prescribed Repo
  Future<List<MedicinePrescribedModel>> fetchAllMedicinePrescribed() {
    return _medicineApiClient.fetchMedicinePrescribedDetailList();
  }

  Future<MedicinePrescribedModel> fetchMedicinePrescribedByID(int id) {
    return _medicineApiClient.getMedicinePrescribedDetailByID(id);
  }

  Future<bool> createUpdateMedicinePrescribedDetail(MedicinePrescribedModel medicinePrescribedModel) {
    return _medicineApiClient.addUpdateMedicinePrescribedDetail(medicinePrescribedModel);
  }
//#endregion

  //#region Medicine Repo
  Future<List<MedicineModel>> fetchAllMedicine() {
    return _medicineApiClient.fetchMedicineDetailList();
  }

  Future<MedicineModel> fetchMedicineByID(int id) {
    return _medicineApiClient.getMedicineByID(id);
  }

  Future<bool> createUpdateMedicineDetail(MedicineModel medicineModel) {
    return _medicineApiClient.addUpdateMedicineDetail(medicineModel);
  }
//#endregion

  //#region Dosage Repo
  Future<List<DosageModel>> fetchAllDosage() {
    return _medicineApiClient.fetchDosageDetailList();
  }

  Future<DosageModel> fetchDosageByID(int id) {
    return _medicineApiClient.getDosageByID(id);
  }

  Future<bool> createUpdateDosageDetail(DosageModel dosageModel) {
    return _medicineApiClient.addUpdateDosageDetail(dosageModel);
  }
//#endregion
}