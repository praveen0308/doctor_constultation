import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/network/services/appointment_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppointmentRepository {
  late Dio _dio;
  late AppointmentApiClient _appointmentApiClient;

  AppointmentRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _appointmentApiClient = AppointmentApiClient(_dio);
  }
  //#region Appointment Detail Repo
  Future<List<AppointmentDetailModel>> fetchAllAppointmentDetails(int userId) {
    return _appointmentApiClient.fetchAppointmentDetailList(userId);
  }

  Future<AppointmentDetailModel> fetchAppointmentDetailByID(int id) {
    return _appointmentApiClient.getAppointmentDetailByID(id);
  }

  Future<bool> createUpdateAppointmentDetail(AppointmentDetailModel appointmentDetailModel) {
    return _appointmentApiClient.addUpdateAppointmentDetail(appointmentDetailModel);
  }
//#endregion

  //#region Slot Detail Repo
  Future<List<SlotModel>> fetchAllSlotDetail() {
    return _appointmentApiClient.fetchSlotDetailList();
  }

  Future<SlotModel> fetchSlotDetailByID(int id) {
    return _appointmentApiClient.getSlotDetailByID(id);
  }

  Future<bool> createUpdateSlotDetail(SlotModel slotModel) {
    return _appointmentApiClient.addUpdateSlotDetail(slotModel);
  }
//#endregion
}