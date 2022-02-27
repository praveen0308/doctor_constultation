import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';
part 'schedule_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ScheduleApiClient {
  factory ScheduleApiClient(Dio dio, {String baseUrl}) = _ScheduleApiClient;

  //#region Schedule Detail Service
  @GET("Schedule/GetAllScheduleDetails")
  Future<List<ScheduleModel>> fetchScheduleList();

  @GET("Schedule/GetScheduleDetailByID")
  Future<ScheduleModel> getScheduleByID(@Query("ID") int id);

  @POST("Schedule/AddUpdateScheduleDetails")
  Future<bool> addUpdateSchedule(@Body() ScheduleModel scheduleModel);

  @POST("Schedule/AddScheduleDetails")
  Future<bool> addScheduleDetails(@Body() Map<String, dynamic> schedule);

  @GET("Schedule/GetAvailableSlotByDate")
  Future<List<ScheduleModel>> getAvailableSlotsByDate(
      @Query("scheduleDate") String scheduleDate);

  @GET("/Schedule/GetAvailableSlotByDateRange")
  Future<List<ScheduleModel>> getAvailableSlotsByDateRange(
      @Query("startDate") String startDate, @Query("endDate") String endDate);
//#endregion
}
