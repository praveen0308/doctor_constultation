// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ScheduleApiClient implements ScheduleApiClient {
  _ScheduleApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://doctorconsult.pocketmoney.net.in/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<ScheduleModel>> fetchScheduleList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ScheduleModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Schedule/GetAllScheduleDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ScheduleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ScheduleModel> getScheduleByID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ScheduleModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Schedule/GetScheduleDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ScheduleModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateSchedule(scheduleModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(scheduleModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Schedule/AddUpdateScheduleDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<bool> addScheduleDetails(schedule) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(schedule);
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Schedule/AddScheduleDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<ScheduleModel>> getAvailableSlotsByDate(scheduleDate) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'scheduleDate': scheduleDate};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ScheduleModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Schedule/GetAvailableSlotByDate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ScheduleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ScheduleModel>> getAvailableSlotsByDateRange(
      startDate, endDate) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'startDate': startDate,
      r'endDate': endDate
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ScheduleModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Schedule/GetAvailableSlotByDateRange',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ScheduleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<bool> cancelScheduleAndAppointment(scheduleDate, scheduleID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'scheduleDate': scheduleDate,
      r'scheduleID': scheduleID
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Schedule/CancelScheduleAndAppointment',
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
