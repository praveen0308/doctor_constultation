import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/doctor_detail_model.dart';
import 'package:doctor_consultation/models/api/fact_model.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/models/api/user_review_model.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/network/services/account_api_client.dart';
import 'package:doctor_consultation/network/services/util_api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class UtilRepository {
  late Dio _dio;
  late UtilApiClient _utilApiClient;

  UtilRepository() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    _utilApiClient = UtilApiClient(_dio);
  }

  Future<List<FactModel>> fetchFactList() {
    return _utilApiClient.fetchFactList();
  }

  Future<List<UserReviewModel>> fetchUserReviews() {
    return _utilApiClient.getAllReviews();
  }

  Future<List<VideoModel>> fetchAllVideos() {
    return _utilApiClient.getAllVideos();
  }
}
