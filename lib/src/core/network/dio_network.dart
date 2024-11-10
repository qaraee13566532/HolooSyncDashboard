import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../features/domain/models/base_response.dart';
import '../../features/domain/models/user_token.dart';
import '../../features/domain/usecases/sunc_result_usecase.dart';
import '../helper/helper.dart';
import '../utils/constant/network_constant.dart';
import '../utils/injections.dart';

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;



  static void initDio() {
    appAPI = Dio(baseOptions(apiUrl));
  }

  /// App interceptor
  static void addInterceptor(LoginRequest userLogin,UserToken userToken)
  {
    var synResultUseCase = sl<SynResultUseCase>();
    var interceptor = InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${userToken.token}';
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          var newAccessToken = await synResultUseCase.login(userLogin);
          'Bearer ${newAccessToken?.data?.token}';
          return handler.resolve(await appAPI.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    );
    appAPI.interceptors.add(interceptor);
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
