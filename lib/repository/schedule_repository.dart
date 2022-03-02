import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/network/services/schedule_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ScheduleRepository {
  late Dio _dio;
  late ScheduleApiClient _scheduleApiClient;

  ScheduleRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _scheduleApiClient = ScheduleApiClient(_dio);
  }

  //#region Video Call Payment History Repo
  Future<List<ScheduleModel>> fetchAllSchedule() {
    return _scheduleApiClient.fetchScheduleList();
  }

  Future<ScheduleModel> fetchScheduleByID(int id) {
    return _scheduleApiClient.getScheduleByID(id);
  }

  Future<bool> createUpdateScheduleDetail(ScheduleModel scheduleModel) {
    return _scheduleApiClient.addUpdateSchedule(scheduleModel);
  }

  Future<bool> addScheduleDetails(String date, List<int> slots) {
    Map<String, dynamic> bodyObj = {};
    bodyObj["UserId"] = 1;
    bodyObj["ScheduleDate"] = date;
    bodyObj["SlotIDs"] = slots;
    return _scheduleApiClient.addScheduleDetails(bodyObj);
  }

  Future<List<ScheduleModel>> getAvailableSlotsByDate(String date) {
    return _scheduleApiClient.getAvailableSlotsByDate(date);
  }

  Future<List<ScheduleModel>> getAvailableSlotsByDateRange(
      String startDate, String endDate) {
    return _scheduleApiClient.getAvailableSlotsByDateRange(startDate, endDate);
  }

  Future<bool> cancelScheduleAndAppointment(
      String scheduleDate, int scheduleID) async {
    return _scheduleApiClient.cancelScheduleAndAppointment(
        scheduleDate, scheduleID);
  }
//#endregion
}
