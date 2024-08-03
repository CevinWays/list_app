import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import 'form_data_ext.dart';

class NetworkInterceptor extends Interceptor {
  NetworkInterceptor({this.logIsAllowed = false});

  bool logIsAllowed;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final data = (options.data is FormData)
        ? (options.data as FormData).toJson()
        : json.encode(options.data);

    var logRequest = '\nRequest: ${options.baseUrl}${options.path} \n'
        '[Headers] : ${json.encode(options.headers)} \n'
        '[Params] : ${json.encode(options.queryParameters)} \n'
        '[Body] : $data \n';

    (logIsAllowed) ? developer.log(logRequest) : null;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var logResponse = '\n[Response] (${response.statusCode}) :'
        ' ${json.encode(response.data)}\n';
    (logIsAllowed) ? developer.log(logResponse) : null;
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    var logError = '\n[Error Message]: ${err.message}';
    (logIsAllowed) ? developer.log(logError) : null;

    var errorResponse = '\n[Error Response]'
        '\nHeaders : ${err.response?.headers.toString()}'
        '\nParams: ${err.response?.requestOptions.queryParameters.toString()}'
        '\nData : ${json.encode(err.response?.data)}'
        '\nStacktrace: ${err.stackTrace.toString()}';
    (logIsAllowed) ? developer.log(errorResponse) : null;
    handler.next(err);
  }
}
