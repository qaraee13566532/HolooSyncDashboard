import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import '../../domain/models/sync.dart';
import '../../domain/models/user_token.dart';

abstract class AbstractSyncApi {
  Future<ApiResponse<UserToken>?> login(LoginRequest params);
  Future<ApiResponse<SyncResponses>?> getSyncResults(SyncRequest params);
}
