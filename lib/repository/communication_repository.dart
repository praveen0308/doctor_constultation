import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/notification_model.dart';
import 'package:doctor_consultation/models/api/video_call_detail_model.dart';
import 'package:doctor_consultation/network/services/communication_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CommunicationRepository {
  late Dio _dio;
  late CommunicationApiClient _communicationApiClient;

  CommunicationRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _communicationApiClient = CommunicationApiClient(_dio);
  }
  //#region Video Call Detail Repo
  Future<List<VideoCallDetailModel>> fetchAllVideoCallDetail() {
    return _communicationApiClient.fetchVideoCallDetailList();
  }

  Future<VideoCallDetailModel> fetchVideoCallDetailByID(int id) {
    return _communicationApiClient.getVideoCallDetailByID(id);
  }

  Future<bool> createUpdateVideoCallDetail(VideoCallDetailModel videoCallDetailModel) {
    return _communicationApiClient.addUpdateVideoCallDetail(videoCallDetailModel);
  }
//#endregion

  //#region Notification Detail Repo
  Future<List<NotificationModel>> fetchAllNotificationDetail() {
    return _communicationApiClient.fetchNotificationDetailList();
  }

  Future<NotificationModel> fetchNotificationDetailByID(int id) {
    return _communicationApiClient.getNotificationDetailByID(id);
  }

  Future<bool> createUpdateNotificationDetail(NotificationModel notificationModel) {
    return _communicationApiClient.addUpdateNotificationDetail(notificationModel);
  }
//#endregion
}