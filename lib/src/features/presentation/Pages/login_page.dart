import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:holoo_dashboard/src/features/presentation/Pages/home_page.dart';
import 'package:holoo_dashboard/src/features/presentation/bloc/login_state.dart';

import '../../../core/router/app_route_enum.dart';
import '../../../core/utils/injections.dart';
import '../../domain/models/sync.dart';
import '../../domain/models/user_token.dart';
import '../../domain/usecases/sunc_result_usecase.dart';
import '../bloc/login_bloc.dart';

const users = {
  'tozintech': 'ttech',
};

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  Duration get loginTime => const Duration(milliseconds: 500);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  static String? defaultTextValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid input';
    }
    return null;
  }

  final LoginCubit _cubit = LoginCubit(const InitLoginState(),
      synResultUseCase: sl<SynResultUseCase>());

  @override
  Widget build(BuildContext context) {
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return BlocProvider<LoginCubit>(
      create: (context) => _cubit,
      child: BlocBuilder(
        bloc: _cubit,
        builder: (context, state) {
          return FlutterLogin(
            userType: LoginUserType.firstName,
            title: 'Tozin Tech',
            logo: const AssetImage('assets/tom.png'),
            onLogin: (LoginData data) {
              context.read<LoginCubit>().login(
                  LoginRequest(userName: data.name, password: data.password));
            },
            onSignup: (_) => Future(() {}),
            onSubmitAnimationCompleted: () {
              if (state is SuccessLoginState) {
                context.go(AppRouteEnum.homePage.name);
              } else {
                context.push(AppRouteEnum.loginPage.name);
              }
            },
            onRecoverPassword: (_) => Future(() {}),
            theme: LoginTheme(
              textFieldStyle: const TextStyle(
                fontFamily: 'BNazanin',
                color: Colors.orange,
                shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
              ),
              bodyStyle: const TextStyle(
                fontSize: 22,
                fontFamily: 'BNazanin',
              ),
              titleStyle: const TextStyle(
                fontSize: 36,
                fontFamily: 'BNazanin',
              ),
              buttonStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'BNazanin',
              ),
              inputTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.purple.withOpacity(.1),
                contentPadding: EdgeInsets.zero,
                errorStyle: const TextStyle(
                  backgroundColor: Colors.orange,
                  color: Colors.white,
                ),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BNazanin',
                ),
              ),
            ),
            userValidator: defaultTextValidator,
            messages: LoginMessages(
              userHint: 'نام کاربری',
              passwordHint: 'رمز',
              confirmPasswordHint: 'تایید',
              loginButton: 'ورود',
              signupButton: 'ثبت کاربر',
              forgotPasswordButton: 'فراموشی رمز',
              recoverPasswordButton: 'راهنمایی کنید',
              goBackButton: 'برگشت',
              confirmPasswordError: '!یکسان نیست',
              recoverPasswordDescription:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
              recoverPasswordSuccess: 'Password rescued successfully',
            ),
          );
        },
      ),
    );
  }
}
