import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/base_response.dart';
import '../../domain/models/sync.dart';
import '../../domain/models/user_token.dart';
import '../../domain/usecases/sunc_result_usecase.dart';


class LoginCubit extends Cubit<UserToken?> {
  final SynResultUseCase synResultUseCase;

  LoginCubit(super.initialState, {required this.synResultUseCase});

  void login(LoginRequest params) async {
    emit((await synResultUseCase.login(params))?.data);
  }
}