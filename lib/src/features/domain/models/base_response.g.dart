// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuccessImpl _$$SuccessImplFromJson(Map<String, dynamic> json) =>
    _$SuccessImpl(
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$SuccessImplToJson(_$SuccessImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$FailureImpl _$$FailureImplFromJson(Map<String, dynamic> json) =>
    _$FailureImpl(
      message: json['message'] as String? ?? '',
      errorCode: json['errorCode'] as String? ?? '',
    );

Map<String, dynamic> _$$FailureImplToJson(_$FailureImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errorCode': instance.errorCode,
    };

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseImpl<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      success: json['success'] == null
          ? null
          : Success.fromJson(json['success'] as Map<String, dynamic>),
      failure: json['failure'] == null
          ? null
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'success': instance.success,
      'failure': instance.failure,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
