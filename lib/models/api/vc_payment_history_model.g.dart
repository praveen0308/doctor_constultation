// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc_payment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcPaymentHistoryModel _$VcPaymentHistoryModelFromJson(
        Map<String, dynamic> json) =>
    VcPaymentHistoryModel(
      ID: json['ID'] as int?,
      VideoCallID: json['VideoCallID'] as int?,
      PaymentID: json['PaymentID'] as String?,
      PaymentRequestID: json['PaymentRequestID'] as String?,
      Amount: json['Amount'] as int?,
      PaymentStatus: json['PaymentStatus'] as String?,
      LongURL: json['LongURL'] as String?,
      SettlementDate: json['SettlementDate'] as int?,
      IsSettlementCreated: json['IsSettlementCreated'] as bool?,
      SettlementStatus: json['SettlementStatus'] as String?,
      TransactionFees: json['TransactionFees'] as int?,
      GST: json['GST'] as int?,
    );

Map<String, dynamic> _$VcPaymentHistoryModelToJson(
        VcPaymentHistoryModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'VideoCallID': instance.VideoCallID,
      'PaymentID': instance.PaymentID,
      'PaymentRequestID': instance.PaymentRequestID,
      'Amount': instance.Amount,
      'PaymentStatus': instance.PaymentStatus,
      'LongURL': instance.LongURL,
      'SettlementDate': instance.SettlementDate,
      'IsSettlementCreated': instance.IsSettlementCreated,
      'SettlementStatus': instance.SettlementStatus,
      'TransactionFees': instance.TransactionFees,
      'GST': instance.GST,
    };
