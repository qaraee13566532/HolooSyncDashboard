
import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import '../models/sync.dart';
import '../models/user_token.dart';

abstract class AbstractSyncResultsRepository {
  Future<ApiResponse<UserToken>?> login(LoginRequest params);
  Future<ApiResponse<SyncResponses>?> getSyncResults(SyncRequest params);
  Future<ApiResponse<SyncResponses>?> getFailedItems();
}
