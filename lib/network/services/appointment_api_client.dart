import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';
part 'appointment_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppointmentApiClient {
  factory AppointmentApiClient(Dio dio,
      {String baseUrl}) = _AppointmentApiClient;

  //#region Appointment Detail Service
  @GET("Appointment/GetAllAppointmentDetails")
  Future<List<AppointmentDetailModel>> fetchAppointmentDetailList(@Query("userId") int userID);

  @GET("Appointment/GetAppointmentDetailByID")
  Future<AppointmentDetailModel> getAppointmentDetailByID(@Query("ID") int id);

  @POST("Appointment/AddUpdateAppointmentDetails")
  Future<bool> addUpdateAppointmentDetail(@Body() AppointmentDetailModel appointmentDetailModel);
//#endregion

  //#region Slot Detail Service
  @GET("Appointment/GetAllSlotDetails")
  Future<List<SlotModel>> fetchSlotDetailList();

  @GET("Appointment/GetSlotDetailByID")
  Future<SlotModel> getSlotDetailByID(@Query("ID") int id);

  @POST("Appointment/AddUpdateSlotDetails")
  Future<bool> addUpdateSlotDetail(@Body() SlotModel slotModel);
//#endregion
}