import 'dart:convert';

import 'package:dio/dio.dart';
import '../utilities/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 10 * 1000,
        receiveTimeout: 10 * 1000,
      ),
    );
    return dio;
  }

  Future<Map<String, dynamic>> getData({
    required String Category,
    required String country,
  }) async {
    var response = await dio!.get('/v2/top-headlines', queryParameters: {
      'country': '$country',
      'category': '$Category',
      'apiKey': 'b9ab488bbd3247f4a905bfdb17ed8d9c',
    });
    print('API METHOD');
    print(response.data);

    return response.data;
  }

  Future<Map<String, dynamic>> getSearch({
    required String Value,
  }) async {
    var response = await dio!.get('v2/everything', queryParameters: {
      'q': '$Value',
      'apiKey': 'b9ab488bbd3247f4a905bfdb17ed8d9c',
    });
    print('API METHOD');
    print(response.data);

    return response.data;
  }
}
