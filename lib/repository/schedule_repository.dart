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
//#endregion
}