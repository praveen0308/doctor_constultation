import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/dosage_model.dart';
import 'package:doctor_consultation/models/api/medicine_model.dart';
import 'package:doctor_consultation/models/api/medicine_prescribed_model.dart';
import 'package:doctor_consultation/models/api/prescription_medicine_model.dart';
import 'package:doctor_consultation/models/api/prescription_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';

part 'medicine_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class MedicineApiClient {
  factory MedicineApiClient(Dio dio,
      {String baseUrl}) = _MedicineApiClient;

  //#region Prescription Detail Service
  @GET("Medicine/GetAllPrescriptionDetails")
  Future<List<PrescriptionModel>> fetchPrescriptionDetailList();

  @GET("Medicine/GetPrescriptionDetailByID")
  Future<PrescriptionModel> getPrescriptionDetailByID(@Query("ID") int id);

  @POST("Medicine/AddUpdatePrescriptionDetail")
  Future<bool> addUpdatePrescriptionDetail(@Body() PrescriptionModel prescriptionModel);
  //#endregion

  //#region Prescription Medicine Detail Service
  @GET("Medicine/GetAllPrescriptionMedicineDetails")
  Future<List<PrescriptionMedicineModel>> fetchPrescriptionMedicineDetailList();

  @GET("Medicine/GetPrescriptionMedicineDetailByID")
  Future<PrescriptionMedicineModel> getPrescriptionMedicineByID(@Query("ID") int id);

  @POST("Medicine/AddUpdatePrescriptionMedicineDetail")
  Future<bool> addUpdatePrescriptionMedicineDetail(@Body() PrescriptionMedicineModel prescriptionMedicineModel);
  //#endregion

  //#region Medicine Prescribed Detail Service
  @GET("Medicine/GetAllMedicinePrescribedDetails")
  Future<List<MedicinePrescribedModel>> fetchMedicinePrescribedDetailList();

  @GET("Medicine/GetMedicinePrescribedDetailByID")
  Future<MedicinePrescribedModel> getMedicinePrescribedDetailByID(@Query("MedID") int medID);

  @POST("Medicine/AddUpdateMedicinePrescribedDetail")
  Future<bool> addUpdateMedicinePrescribedDetail(@Body() MedicinePrescribedModel medicinePrescribedModel);
  //#endregion

  //#region Medicine Detail Service
  @GET("Medicine/GetAllMedicineDetails")
  Future<List<MedicineModel>> fetchMedicineDetailList();

  @GET("Medicine/GetMedicineDetailByID")
  Future<MedicineModel> getMedicineByID(@Query("mID") int mID);

  @POST("Medicine/AddUpdateMedicineDetail")
  Future<bool> addUpdateMedicineDetail(@Body() MedicineModel medicineModel);
  //#endregion

  //#region Dosage Detail Service
  @GET("Medicine/AddUpdateDosageDetail")
  Future<List<DosageModel>> fetchDosageDetailList();

  @GET("Medicine/GetDosageDetailByID")
  Future<DosageModel> getDosageByID(@Query("dID") int dID);

  @POST("Medicine/AddUpdateMedicineDetail")
  Future<bool> addUpdateDosageDetail(@Body() DosageModel dosageModel);
//#endregion
}