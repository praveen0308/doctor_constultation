import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/notification_model.dart';
import 'package:doctor_consultation/models/api/video_call_detail_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';

part 'communication_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CommunicationApiClient {
  factory CommunicationApiClient(Dio dio,
      {String baseUrl}) = _CommunicationApiClient;

  //#region Video Call Detail Service
  @GET("Communication/GetAllVideoCallDetails")
  Future<List<VideoCallDetailModel>> fetchVideoCallDetailList();

  @GET("Communication/GetVideoCallDetailByID")
  Future<VideoCallDetailModel> getVideoCallDetailByID(@Query("ID") int id);

  @POST("Communication/AddUpdateVideoCallDetails")
  Future<bool> addUpdateVideoCallDetail(@Body() VideoCallDetailModel videoCallDetailModel);
//#endregion

  //#region Notification Detail Service
  @GET("Communication/GetAllNotificationDetails")
  Future<List<NotificationModel>> fetchNotificationDetailList();

  @GET("Communication/GetNotificationDetailByReceiverID")
  Future<List<NotificationModel>> getNotificationDetailByReceiverID(@Query("ID") int id);

  @POST("Communication/AddUpdateNotificationDetails")
  Future<bool> addUpdateNotificationDetail(@Body() NotificationModel notificationModel);

  @POST("Communication/SendChatNotification")
  Future<bool> sendChatNotification(
      @Query("senderid") int senderID,
      @Query("receiverid") int receiverID,
      @Query("message") String message,
      );
//#endregion
}