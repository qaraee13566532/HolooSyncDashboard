import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import 'package:holoo_dashboard/src/features/domain/models/sync.dart';

import '../../../core/network/error/exceptions.dart';
import '../../domain/models/user_token.dart';
import '../../domain/repositories/abstract_sync_results_repository.dart';
import '../data_sources/syncs_impl_api.dart';

class SyncResultRepositoryImpl extends AbstractSyncResultsRepository {
  final SyncImplApi articlesApi;

  SyncResultRepositoryImpl(
    this.articlesApi,
  );

  @override
  Future<ApiResponse<SyncResponses>?> getSyncResults(SyncRequest params) async {
    ApiResponse<SyncResponses>? result;
    try {
      result = await articlesApi.getSyncResults(params);
      return result;
    } on ServerException catch (e) {
      result = result?.copyWith(
        data: null,
        success: null,
        failure: Failure(
          message: e.message,
          errorCode: e.statusCode.toString(),
        ),
      );
      return result;
    }
  }

  @override
  Future<ApiResponse<SyncResponses>?> getFailedItems() async {
    ApiResponse<SyncResponses>? result;
    const params = SyncRequest(Issuccessfull: false);
    result = await getSyncResults(params);
    return result;
  }

  @override
  Future<ApiResponse<UserToken>?> login(LoginRequest params) async {
    ApiResponse<UserToken>? result = ApiResponse<UserToken>();
    try {
      result = await articlesApi.login(params);
      return result;
    } on ServerException catch (e) {
      result = result?.copyWith(
        data: null,
        success: null,
        failure: Failure(
          message: e.message,
          errorCode: e.statusCode.toString(),
        ),
      );
      return result;
    }
  }
}
