import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:doctor_consultation/models/api/fact_model.dart';
import 'package:doctor_consultation/models/api/user_review_model.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
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
  //#region Video Repo
  Future<List<VideoModel>> fetchAllVideos() {
    return _utilApiClient.getAllVideos();
  }

  Future<VideoModel> fetchVideoByID(int id) {
    return _utilApiClient.getVideoByID(id);
  }

  Future<bool> createUpdateVideoDetail(VideoModel videoModel) {
    return _utilApiClient.addUpdateVideoUrlDetail(videoModel);
  }
  //#endregion

  //#region Fact Repo
  Future<List<FactModel>> fetchFactList() {
    return _utilApiClient.fetchFactList();
  }

  Future<FactModel> fetchFactByID(int id) {
    return _utilApiClient.getFactByID(id);
  }

  Future<bool> createUpdateFactDetail(FactModel factModel) {
    return _utilApiClient.addUpdateFactDetail(factModel);
  }
  //#endregion

  //#region Review Repo
  Future<List<UserReviewModel>> fetchUserReviews() {
    return _utilApiClient.fetchReviewList();
  }

  Future<UserReviewModel> fetchReviewByID(int id) {
    return _utilApiClient.getReviewByID(id);
  }

  Future<bool> createUpdateReviewDetail(UserReviewModel userReviewModel) {
    return _utilApiClient.addUpdateReviewDetail(userReviewModel);
  }
  //#endregion
}