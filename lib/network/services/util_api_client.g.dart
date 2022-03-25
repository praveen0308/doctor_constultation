// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'util_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UtilApiClient implements UtilApiClient {
  _UtilApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://doctorconsult.pocketmoney.net.in/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<VideoModel>> getAllVideos() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<VideoModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Utils/GetAllVideoUrlDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => VideoModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<bool> deleteVideoById(videoId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': videoId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/Utils/DeleteVideoDetailsByID',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<VideoModel> getVideoByID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VideoModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Utils/GetVideoUrlDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VideoModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateVideoUrlDetail(videoModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(videoModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Utils/AddUpdateVideoUrlDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<FactModel>> fetchFactList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<FactModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Utils/GetAllFactInfoDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => FactModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<FactModel> getFactByID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FactModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Utils/GetFactInfoDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FactModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateFactDetail(factModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(factModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Utils/AddUpdateFactInfoDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<UserReviewModel>> fetchReviewList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserReviewModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Utils/GetAllReviewInfoDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserReviewModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UserReviewModel> getReviewByID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserReviewModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Utils/GetReviewInfoDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserReviewModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateReviewDetail(userReviewModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userReviewModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Utils/AddUpdateReviewInfoDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
