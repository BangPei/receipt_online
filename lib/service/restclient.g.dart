// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<DailyTask>> findCurrentDailyTask() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<DailyTask>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'daily-task/current',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => DailyTask.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<DailyTask> dailyTaskFindById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DailyTask>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'daily-task/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DailyTask.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Expedition>> findAllExpedition() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Expedition>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'expedition',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Expedition.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Expedition> expeditionFindById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Expedition>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'expedition/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Expedition.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Expedition> postExpedition(expedition) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(expedition.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Expedition>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'expedition',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Expedition.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> expeditionEdit(id, cst) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(cst.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PUT', headers: _headers, extra: _extra)
            .compose(_dio.options, 'expedition/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
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
