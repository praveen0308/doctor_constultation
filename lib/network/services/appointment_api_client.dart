import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';
part 'appointment_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppointmentApiClient {
  factory AppointmentApiClient(Dio dio, {String baseUrl}) =
      _AppointmentApiClient;

  //#region Appointment Detail Service
  @GET("Appointment/GetAllAppointmentDetailsByDate")
  Future<List<AppointmentDetailModel>> getAppointmentDetailsByDate(
      @Query("date") String date);

  @GET("Appointment/GetAllAppointmentDetailsByUserID")
  Future<List<AppointmentDetailModel>> getAppointmentDetailsByUserID(
      @Query("userID") int userId);

  @GET("Appointment/GetAppointmentDetailByID")
  Future<AppointmentDetailModel> getAppointmentDetailByID(@Query("ID") int id);

  @POST("Appointment/AddUpdateAppointmentDetails")
  Future<bool> addUpdateAppointmentDetail(
      @Body() AppointmentDetailModel appointmentDetailModel);

  @GET("Appointment/UpdateAppointmentStatus")
  Future<bool> updateAppointmentStatus(
    @Query("AppointmentID") int appointmentID,
    @Query("StatusID") int statusID,
    @Query("UserID") int userId,
  );

//#endregion

  //#region Slot Detail Service
  @GET("Appointment/GetAllSlotDetails")
  Future<List<SlotModel>> fetchSlotDetailList(@Query("dayID") int dayID);

  @GET("Appointment/GetSlotDetailByID")
  Future<SlotModel> getSlotDetailByID(@Query("ID") int id);

  @POST("Appointment/AddUpdateSlotDetails")
  Future<bool> addUpdateSlotDetail(@Body() SlotModel slotModel);
//#endregion
}
