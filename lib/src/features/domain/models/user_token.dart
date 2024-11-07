import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_token.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user_token.g.dart';

class LoginRequest {
  String? userName;
  String? password;

  LoginRequest({
    this.userName,
    this.password,
  });
}

@freezed
class UserToken with _$UserToken {
  factory UserToken({
    @Default('') String token,
    @Default('') String userCode,
  }) = _UserToken;

  factory UserToken.fromJson(Map<String, Object?> json) =>
      _$UserTokenFromJson(json);
}
