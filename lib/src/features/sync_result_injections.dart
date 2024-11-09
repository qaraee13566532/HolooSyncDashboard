
import '../core/network/dio_network.dart';
import '../core/utils/injections.dart';
import 'data/data_sources/syncs_impl_api.dart';
import 'data/repositories/sync_result_repo_impl.dart';
import 'domain/models/user_token.dart';
import 'domain/repositories/abstract_sync_results_repository.dart';
import 'domain/usecases/sunc_result_usecase.dart';

initArticlesInjections() {
  sl.registerSingleton<SyncImplApi>(SyncImplApi(DioNetwork.appAPI,LoginRequest(userName:'tozintech',password:'ttech')));
  sl.registerSingleton<AbstractSyncResultsRepository>(SyncResultRepositoryImpl(sl()));
  sl.registerSingleton<SynResultUseCase>(SynResultUseCase(sl()));
}
