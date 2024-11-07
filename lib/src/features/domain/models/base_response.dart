import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'base_response.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'base_response.g.dart';

@freezed
class Success with _$Success {
  factory Success({
    @Default('') String message,
  }) = _Success;

  factory Success.fromJson(Map<String, Object?> json) =>
      _$SuccessFromJson(json);
}

@freezed
class Failure with _$Failure {
  factory Failure({
    @Default('') String message,
    @Default('') String errorCode,
  }) = _Failure;

  factory Failure.fromJson(Map<String, Object?> json) =>
      _$FailureFromJson(json);
}

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  factory ApiResponse({T? data, Success? success, Failure? failure}) =
      _ApiResponse<T>;

  factory ApiResponse.fromJson(
          Map<String, Object?> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
