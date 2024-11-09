import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import '../../../core/network/error/dio_error_handler.dart';
import '../../../core/network/error/exceptions.dart';
import '../../domain/models/sync.dart';
import '../../domain/models/user_token.dart';
import 'abstract_sync_api.dart';

class SyncImplApi extends AbstractSyncApi {
  Dio? dio;
  final LoginRequest loginRequest;
  CancelToken cancelToken = CancelToken();

  SyncImplApi(this.dio, this.loginRequest);

  // Sync Method
  @override
  Future<ApiResponse<SyncResponses>?> getSyncResults(SyncRequest params) async {
    ApiResponse<SyncResponses>? result;
    try {
      Response response =
          await dio!.post('/api/SyncStatus/Info', data: json.encode(params));
      if (response.data == null) {
        throw ServerException("خطا: بدون اطلاعات پاسخ .", response.statusCode);
      }
      result = ApiResponse.fromJson(response.data,
          (Object? json) => SyncResponses.fromJson(response.data));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
    return result;
  }

  @override
  Future<ApiResponse<UserToken>?> login(LoginRequest params) async {
    print('login');
    ApiResponse<UserToken>? resp;
    try {
      Response response = await dio!.post(
        '/api/User/authenticate',
        data: {'username': params.userName, 'password': params.password},
      );
      print(response.data);
      if (response.data == null) {
        throw ServerException("خطا: بدون اطلاعات پاسخ .", response.statusCode);
      }
      resp = ApiResponse.fromJson(response.data,
          (Object? json) => UserToken.fromJson(response.data['data']));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }

    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add the access token to the request header

          options.headers['Authorization'] = 'Bearer $resp.data?.token';
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // If a 401 response is received, refresh the access token
            String? newAccessToken = (await login(
                    LoginRequest(password: loginRequest.password, userName: loginRequest.userName)))!
                .data!
                .token;

            // Update the request header with the new access token
            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';

            // Repeat the request with the updated header
            return handler.resolve(await dio!.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
    return resp;
  }
}
