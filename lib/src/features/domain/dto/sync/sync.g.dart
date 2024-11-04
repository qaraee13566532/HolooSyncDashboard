// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncResponseImpl _$$SyncResponseImplFromJson(Map<String, dynamic> json) =>
    _$SyncResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      deviceId: (json['deviceId'] as num?)?.toInt(),
      objectType: (json['objectType'] as num?)?.toInt(),
      objectId: (json['objectId'] as num?)?.toInt(),
      objectCode: json['objectCode'] as String?,
      ErrorCode: json['ErrorCode'] as String?,
      isSuccessfull: json['isSuccessfull'] as bool?,
      ErrorMessage: json['ErrorMessage'] as String?,
      apiResponseOk: json['apiResponseOk'] as bool?,
      apiRequestMessage: json['apiRequestMessage'] as String?,
      apiResponseMessage: json['apiResponseMessage'] as String?,
      receiptNumber: json['receiptNumber'] as String?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      updatedTime: json['updatedTime'] == null
          ? null
          : DateTime.parse(json['updatedTime'] as String),
    );

Map<String, dynamic> _$$SyncResponseImplToJson(_$SyncResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'objectType': instance.objectType,
      'objectId': instance.objectId,
      'objectCode': instance.objectCode,
      'ErrorCode': instance.ErrorCode,
      'isSuccessfull': instance.isSuccessfull,
      'ErrorMessage': instance.ErrorMessage,
      'apiResponseOk': instance.apiResponseOk,
      'apiRequestMessage': instance.apiRequestMessage,
      'apiResponseMessage': instance.apiResponseMessage,
      'receiptNumber': instance.receiptNumber,
      'createdTime': instance.createdTime?.toIso8601String(),
      'updatedTime': instance.updatedTime?.toIso8601String(),
    };

_$SyncResponsesImpl _$$SyncResponsesImplFromJson(Map<String, dynamic> json) =>
    _$SyncResponsesImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SyncResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SyncResponsesImplToJson(_$SyncResponsesImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$SyncRequestImpl _$$SyncRequestImplFromJson(Map<String, dynamic> json) =>
    _$SyncRequestImpl(
      FromDate: json['FromDate'] as String?,
      ToDate: json['ToDate'] as String?,
      FromUDate: json['FromUDate'] as String?,
      ToUDate: json['ToUDate'] as String?,
      ApiResponseMessage: json['ApiResponseMessage'] as String?,
      FromInvoiceNumber: json['FromInvoiceNumber'] as String?,
      ToInvoiceNumber: json['ToInvoiceNumber'] as String?,
      FromHolooInvoiceNumber: json['FromHolooInvoiceNumber'] as String?,
      ToHolooInvoiceNumber: json['ToHolooInvoiceNumber'] as String?,
      FromDeviceId: json['FromDeviceId'] as String?,
      ToDeviceId: json['ToDeviceId'] as String?,
      ErrorCode: json['ErrorCode'] as String?,
      ObjectType: (json['ObjectType'] as num?)?.toInt(),
      Issuccessfull: json['Issuccessfull'] as bool?,
      ApiResponseOk: json['ApiResponseOk'] as bool?,
    );

Map<String, dynamic> _$$SyncRequestImplToJson(_$SyncRequestImpl instance) =>
    <String, dynamic>{
      'FromDate': instance.FromDate,
      'ToDate': instance.ToDate,
      'FromUDate': instance.FromUDate,
      'ToUDate': instance.ToUDate,
      'ApiResponseMessage': instance.ApiResponseMessage,
      'FromInvoiceNumber': instance.FromInvoiceNumber,
      'ToInvoiceNumber': instance.ToInvoiceNumber,
      'FromHolooInvoiceNumber': instance.FromHolooInvoiceNumber,
      'ToHolooInvoiceNumber': instance.ToHolooInvoiceNumber,
      'FromDeviceId': instance.FromDeviceId,
      'ToDeviceId': instance.ToDeviceId,
      'ErrorCode': instance.ErrorCode,
      'ObjectType': instance.ObjectType,
      'Issuccessfull': instance.Issuccessfull,
      'ApiResponseOk': instance.ApiResponseOk,
    };
