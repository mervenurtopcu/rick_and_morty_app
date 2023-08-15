import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/info_model.dart';

abstract class IGetDataService {
  static final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getAllEntities(String url) async {
    try {
      List<Map<String, dynamic>> allEntities = [];
      String? nextUrl = url;
      while (nextUrl != null) {
        var response = await _dio.get(nextUrl);
        try {
          var dataInfo = response.data["info"];
          // So, we have info object and pagination
          Info info = Info.fromJson(response.data["info"]);
          nextUrl = info.next;
          allEntities.addAll(
              List<Map<String, dynamic>>.from(response.data["results"]));
        } catch (e) {
          // We don't have info object and pagination
          allEntities.addAll(List<Map<String, dynamic>>.from(response.data));
          nextUrl = null;
        }
      }

      return allEntities;
    } on DioException catch (exception) {
      _ShowDebug.showDioError(exception, this);
      rethrow;
    }
  }
}

class _ShowDebug {
  static void showDioError<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
