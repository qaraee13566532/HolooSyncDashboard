import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holoo_dashboard/src/features/presentation/bloc/login_state.dart';
import '../../domain/models/user_token.dart';
import '../../domain/usecases/sunc_result_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  final SynResultUseCase synResultUseCase;

  LoginCubit(super.initialState, {required this.synResultUseCase});

  void login(LoginRequest params) async {
    emit(const LoadingLoginState());
    var result = await synResultUseCase.login(params);
    print(result);
    if (result!.success != null ) {
      emit(const SuccessLoginState());
    } else {
      emit(ErrorLoginState(
          errorMsg: result.failure!.message,
          errorCode: result.failure!.errorCode));
    }
  }
}
