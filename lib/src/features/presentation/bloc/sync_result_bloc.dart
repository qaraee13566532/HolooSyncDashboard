import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/sync.dart';
import '../../domain/usecases/sunc_result_usecase.dart';

class SyncResultCubit extends Cubit<SyncResponses?> {
  final SynResultUseCase synResultUseCase;

  SyncResultCubit(super.initialState, {required this.synResultUseCase});

  void getSyncResults(SyncRequest params) async {
    emit((await synResultUseCase.getSyncResults(params))?.data);
  }

  void getFailedItems() async {
    emit((await synResultUseCase.getFailedItems())?.data);
  }
}
