// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTokenImpl _$$UserTokenImplFromJson(Map<String, dynamic> json) =>
    _$UserTokenImpl(
      token: json['token'] as String? ?? '',
      userCode: json['userCode'] as String? ?? '',
    );

Map<String, dynamic> _$$UserTokenImplToJson(_$UserTokenImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userCode': instance.userCode,
    };
