// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AccountApiClient implements AccountApiClient {
  _AccountApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://doctorconsult.pocketmoney.net.in/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DoctorDetailModel> getDoctorDetailsById(doctorId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'DoctorID': doctorId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DoctorDetailModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Account/GetDoctorDetailsByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DoctorDetailModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateUserDetails(userModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Account/AddUpdateUserDetails',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<UserModel> checkLoginDetails(userName, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'UserName': userName,
      r'Password': password
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Account/CheckLoginDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
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
