import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holoo_dashboard/src/features/presentation/bloc/sync_result_state.dart';
import '../../domain/models/sync.dart';
import '../../domain/usecases/sunc_result_usecase.dart';

class SyncResultCubit extends Cubit<SyncResultState> {
  final SynResultUseCase synResultUseCase;

  SyncResultCubit(super.initialState, {required this.synResultUseCase});

  // void getSyncResults(SyncRequest params) async {
  //   emit((await synResultUseCase.getSyncResults(params))?.data);
  // }

  void getFailedItems() async {

    emit(const LoadingSyncResultState());
    var result = await synResultUseCase.getFailedItems();
    if (result!.success != null ) {
      emit(SuccessSyncResultState());
    } else {
      emit(ErrorSyncResultState(
          errorMsg: result.failure!.message,
          errorCode: result.failure!.errorCode));
    }
  }
}
