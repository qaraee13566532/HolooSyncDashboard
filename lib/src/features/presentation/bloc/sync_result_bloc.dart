import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holoo_dashboard/src/features/domain/models/base_response.dart';
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
    var suc = SuccessSyncResultState();
    suc.response =
        suc.response?.copyWith(success: Success(message: 'thats right'));
    suc.response = suc.response?.copyWith(
      data: SyncResponses(
        data: [
          SyncResponse(
            apiResponseOk: true,
            deviceId: 1,
            isSuccessfull: true,
            id: 10500,
            objectCode: '1200000254681',
          ),
          SyncResponse(
            apiResponseOk: true,
            deviceId: 2,
            isSuccessfull: true,
            id: 10501,
            objectCode: '1200000254682',
          ),
          SyncResponse(
            apiResponseOk: true,
            deviceId: 3,
            isSuccessfull: true,
            id: 10502,
            objectCode: '1200000254683',
          ),
        ],
      ),
    );
    print('fffffffffffffffffffffffffff');
    print(suc.response);
    emit(suc);
    // emit(const LoadingSyncResultState());
    // var result = await synResultUseCase.getFailedItems();
    // if (result!.success != null) {
    //   emit(suc);
    // } else {
    //   emit(ErrorSyncResultState(
    //       errorMsg: result.failure!.message,
    //       errorCode: result.failure!.errorCode));
    // }
  }

/*
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
   */
}
