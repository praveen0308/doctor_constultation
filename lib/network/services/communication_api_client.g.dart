// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CommunicationApiClient implements CommunicationApiClient {
  _CommunicationApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://doctorconsult.pocketmoney.net.in/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<VideoCallDetailModel>> fetchVideoCallDetailList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<VideoCallDetailModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Communication/GetAllVideoCallDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            VideoCallDetailModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<VideoCallDetailModel> getVideoCallDetailByID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VideoCallDetailModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Communication/GetVideoCallDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VideoCallDetailModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateVideoCallDetail(videoCallDetailModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(videoCallDetailModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Communication/AddUpdateVideoCallDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<NotificationModel>> fetchNotificationDetailList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<NotificationModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'Communication/GetAllNotificationDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            NotificationModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<NotificationModel>> getNotificationDetailByReceiverID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<NotificationModel>>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, 'Communication/GetNotificationDetailByReceiverID',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            NotificationModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<bool> addUpdateNotificationDetail(notificationModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(notificationModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Communication/AddUpdateNotificationDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<bool> sendChatNotification(senderID, receiverID, message) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'senderid': senderID,
      r'receiverid': receiverID,
      r'message': message
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Communication/SendChatNotification',
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
