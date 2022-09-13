// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MedicineApiClient implements MedicineApiClient {
  _MedicineApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://doctorconsult.jmminfotech.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<PrescriptionModel>> fetchPrescriptionDetailList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PrescriptionModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Medicine/GetAllPrescriptionDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            PrescriptionModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<PrescriptionModel> getPrescriptionDetailByID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrescriptionModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Medicine/GetPrescriptionDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrescriptionModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdatePrescriptionDetail(prescriptionModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(prescriptionModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Medicine/AddUpdatePrescriptionDetail',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<PrescriptionMedicineModel>>
      fetchPrescriptionMedicineDetailList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PrescriptionMedicineModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'Medicine/GetAllPrescriptionMedicineDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            PrescriptionMedicineModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<PrescriptionMedicineModel> getPrescriptionMedicineByID(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ID': id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrescriptionMedicineModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'Medicine/GetPrescriptionMedicineDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrescriptionMedicineModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdatePrescriptionMedicineDetail(
      prescriptionMedicineModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(prescriptionMedicineModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(
                _dio.options, 'Medicine/AddUpdatePrescriptionMedicineDetail',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<MedicinePrescribedModel>>
      fetchMedicinePrescribedDetailList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicinePrescribedModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'Medicine/GetAllMedicinePrescribedDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            MedicinePrescribedModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicinePrescribedModel> getMedicinePrescribedDetailByID(medID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'MedID': medID};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicinePrescribedModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, 'Medicine/GetMedicinePrescribedDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MedicinePrescribedModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateMedicinePrescribedDetail(
      medicinePrescribedModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicinePrescribedModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Medicine/AddUpdateMedicinePrescribedDetail',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<MedicineModel>> fetchMedicineDetailList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicineModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Medicine/GetAllMedicineDetails',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MedicineModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicineModel> getMedicineByID(mID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'mID': mID};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicineModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Medicine/GetMedicineDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MedicineModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateMedicineDetail(medicineModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicineModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Medicine/AddUpdateMedicineDetail',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<DosageModel>> fetchDosageDetailList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<DosageModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Medicine/AddUpdateDosageDetail',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => DosageModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<DosageModel> getDosageByID(dID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'dID': dID};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DosageModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Medicine/GetDosageDetailByID',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DosageModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<bool> addUpdateDosageDetail(dosageModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dosageModel.toJson());
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'Medicine/AddUpdateMedicineDetail',
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
