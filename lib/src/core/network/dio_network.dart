import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../features/domain/models/user_token.dart';
import '../helper/helper.dart';
import '../utils/constant/network_constant.dart';

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;

  static void initDio() {
    appAPI = Dio(baseOptions(apiUrl));
    appAPI.interceptors.add(interceptorsWrapper());
  }

  /// App interceptor
  static InterceptorsWrapper interceptorsWrapper() {
    return  InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add the access token to the request header

     //   options.headers['Authorization'] = 'Bearer $resp.data?.token';
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // If a 401 response is received, refresh the access token
  //        String? newAccessToken = (await login(
  //            LoginRequest(password: loginRequest.password, userName: loginRequest.userName)))!
   //           .data!
    //          .token;

          // Update the request header with the new access token
   //       e.requestOptions.headers['Authorization'] =
   //       'Bearer $newAccessToken';

          // Repeat the request with the updated header
          return handler.resolve(await appAPI.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    );
  }

  static BaseOptions baseOptions(String url) {
    Map<String, dynamic> headers = Helper.getHeaders();

    return BaseOptions(
        baseUrl: url,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: headers..removeWhere((key, value) => value == null),
        responseType: ResponseType.json);
  }
}
