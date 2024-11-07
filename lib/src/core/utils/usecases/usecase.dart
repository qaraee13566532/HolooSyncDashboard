
import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';

import '../../../features/domain/models/sync.dart';
import '../../../features/domain/models/user_token.dart';

abstract class AbstractUseCase{
  Future<ApiResponse<UserToken>?> login(LoginRequest params);
  Future<ApiResponse<SyncResponses>?> getSyncResults(SyncRequest params);
  Future<ApiResponse<SyncResponses>?> getFailedItems();
}


