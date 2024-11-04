import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sync.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'sync.g.dart';

enum ObjectType {
  Invoice(1),
  WorkOrders(2),
  Layaway(5),
  Customer(6),
  CustomerPayment(7),
  PayToCustomer(8),
  Item(9),
  Category(10),
  Department(11);

  const ObjectType(this.value);

  final int value;
}

@freezed
class SyncResponse with _$SyncResponse {
  const factory SyncResponse({
    int? id,
    int? deviceId,
    int? objectType,
    int? objectId,
    String? objectCode,
    String? ErrorCode,
    bool? isSuccessfull,
    String? ErrorMessage,
    bool? apiResponseOk,
    String? apiRequestMessage,
    String? apiResponseMessage,
    String? receiptNumber,
    DateTime? createdTime,
    DateTime? updatedTime,
  }) = _SyncResponse;

  factory SyncResponse.fromJson(Map<String, Object?> json) =>
      _$SyncResponseFromJson(json);
}

@freezed
class SyncResponses with _$SyncResponses {
  const factory SyncResponses({List<SyncResponse>? data}) = _SyncResponses;

  factory SyncResponses.fromJson(Map<String, dynamic> json) =>
      _$SyncResponsesFromJson(json);
}

@freezed
class SyncRequest with _$SyncRequest {
  const factory SyncRequest({
    String? FromDate,
    String? ToDate,
    String? FromUDate,
    String? ToUDate,
    String? ApiResponseMessage,
    String? FromInvoiceNumber,
    String? ToInvoiceNumber,
    String? FromHolooInvoiceNumber,
    String? ToHolooInvoiceNumber,
    String? FromDeviceId,
    String? ToDeviceId,
    String? ErrorCode,
    int? ObjectType,
    bool? Issuccessfull,
    bool? ApiResponseOk,
  }) = _SyncRequest;

  factory SyncRequest.fromJson(Map<String, Object?> json) =>
      _$SyncRequestFromJson(json);
}
