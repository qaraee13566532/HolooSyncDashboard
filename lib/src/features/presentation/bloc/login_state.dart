import 'package:flutter/material.dart';

abstract class LoginState {
  const LoginState();
}


class InitLoginState  extends LoginState{
  const InitLoginState();
}

class LoadingLoginState  extends LoginState{
  const LoadingLoginState();
}

class SuccessLoginState  extends LoginState{
  const SuccessLoginState();
}


class ErrorLoginState extends LoginState {
  final String errorMsg;
  final String errorCode;
  ErrorLoginState({ required this.errorMsg, required this.errorCode});
}