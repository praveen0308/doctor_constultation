import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/fact_model.dart';
import 'package:doctor_consultation/models/api/stat_model.dart';
import 'package:doctor_consultation/models/api/user_review_model.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';
part 'util_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class UtilApiClient {
  factory UtilApiClient(Dio dio, {String baseUrl}) = _UtilApiClient;

  //#region Video Service
  @GET("Utils/GetAllVideoUrlDetails")
  Future<List<VideoModel>> getAllVideos();

  @POST("/Utils/DeleteVideoDetailsByID")
  Future<bool> deleteVideoById(@Query("ID") int videoId);

  @GET("Utils/GetVideoUrlDetailByID")
  Future<VideoModel> getVideoByID(@Query("ID") int id);

  @POST("Utils/AddUpdateVideoUrlDetails")
  Future<bool> addUpdateVideoUrlDetail(@Body() VideoModel videoModel);
  //#endregion

  //#region Fact Service
  @GET("Utils/GetAllFactInfoDetails")
  Future<List<FactModel>> fetchFactList();

  @GET("Utils/GetFactInfoDetailByID")
  Future<FactModel> getFactByID(@Query("ID") int id);

  @POST("Utils/AddUpdateFactInfoDetails")
  Future<bool> addUpdateFactDetail(@Body() FactModel factModel);
  //#endregion

  //#region Review Service
  @GET("Utils/GetAllReviewInfoDetails")
  Future<List<UserReviewModel>> fetchReviewList();

  @GET("Utils/GetReviewInfoDetailByID")
  Future<UserReviewModel> getReviewByID(@Query("ID") int id);

  @POST("Utils/AddUpdateReviewInfoDetails")
  Future<bool> addUpdateReviewDetail(@Body() UserReviewModel userReviewModel);
  //#endregion

  @GET("Utils/GetStatsByDoctor")
  Future<StatModel> getStatsByDoctor(@Query("ID") int id);
}
