import 'dart:convert';

import 'package:dio/dio.dart';
import '../utils/common_util.dart';



///
/// [NetworkError] is extension for [DioException]
/// method [toJson] is used for convert error response to JSON format
///
extension NetworkError on DioException {
  Map<String, dynamic> toJson() {
    if (CommonUtil.jsonIsValid(response?.data)) {
      return response?.data;
    } else {
      if (response?.data is Map) {
        return json.decode(json.encode(response?.data));
      } else {
        if (CommonUtil.jsonIsValid(response?.data)) {
          return json.decode(response?.data);
        } else {
          final contentJson = <String, dynamic>{};
          contentJson['status'] = response?.statusCode;
          contentJson['code'] = 0;
          contentJson['message'] = response?.statusMessage;

          return json.decode(json.encode(contentJson));
        }
      }
    }
  }

  bool isVerified() => response?.statusCode == 300;

  bool isUnauthorized() => response?.statusCode == 401;

  bool isForbidden() => response?.statusCode == 403;

  bool isServerProblem() => response?.statusCode == 500;

  bool isBadRequest() => response?.statusCode == 400;

  bool isNotFound() => response?.statusCode == 404;

  bool isUnprocessable() => response?.statusCode == 422;

  bool isClientError() =>
      (response?.statusCode ?? 0) >= 400 && (response?.statusCode ?? 500) < 500;
}
