import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/base_response.dart';
import '../../domain/models/sync.dart';
import '../../domain/models/user_token.dart';
import '../../domain/usecases/sunc_result_usecase.dart';


class ArticlesBloc extends Cubit<SyncResponses?> {
  final SynResultUseCase synResultUseCase;

  ArticlesBloc(super.initialState,  this.synResultUseCase);


  @override
  void getSyncResults(SyncRequest params) async {
    emit((await synResultUseCase.getSyncResults(params))?.data);
  }

  void getFailedItems() async {
    emit((await synResultUseCase.getFailedItems())?.data);
  }

}