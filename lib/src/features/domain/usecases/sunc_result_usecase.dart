import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import 'package:holoo_dashboard/src/features/domain/models/sync.dart';

import 'package:holoo_dashboard/src/features/domain/models/user_token.dart';

import '../../../core/utils/usecases/usecase.dart';
import '../repositories/abstract_sync_results_repository.dart';

class SynResultUseCase extends AbstractUseCase {
  final AbstractSyncResultsRepository repository;

  SynResultUseCase(this.repository);

  @override
  Future<ApiResponse<SyncResponses>?> getSyncResults(SyncRequest params) async {
    ApiResponse<SyncResponses>? result = await repository.getSyncResults(params);
    return result;
  }

  @override
  Future<ApiResponse<SyncResponses>?> getFailedItems() async {
    ApiResponse<SyncResponses>? result = await repository.getFailedItems();
    return result;
  }

  @override
  Future<ApiResponse<UserToken>?> login(LoginRequest params) async {
    ApiResponse<UserToken>? result = await repository.login(params);
    return result;
  }
}
