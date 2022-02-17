import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/fact_model.dart';
import 'package:doctor_consultation/models/api/user_review_model.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:retrofit/http.dart';
part 'util_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class UtilApiClient {
  factory UtilApiClient(Dio dio, {String baseUrl}) = _UtilApiClient;
  @GET("Utils/GetAllFactInfoDetails")
  Future<List<FactModel>> fetchFactList();

  @GET("Utils/GetAllVideoUrlDetails")
  Future<List<VideoModel>> getAllVideos();

  @GET("Utils/GetAllReviewInfoDetails")
  Future<List<UserReviewModel>> getAllReviews();
}
