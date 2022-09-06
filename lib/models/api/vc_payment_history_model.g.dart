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
    VcPaymentHistoryModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('VideoCallID', instance.VideoCallID);
  writeNotNull('PaymentID', instance.PaymentID);
  writeNotNull('PaymentRequestID', instance.PaymentRequestID);
  writeNotNull('Amount', instance.Amount);
  writeNotNull('PaymentStatus', instance.PaymentStatus);
  writeNotNull('LongURL', instance.LongURL);
  writeNotNull('SettlementDate', instance.SettlementDate);
  writeNotNull('IsSettlementCreated', instance.IsSettlementCreated);
  writeNotNull('SettlementStatus', instance.SettlementStatus);
  writeNotNull('TransactionFees', instance.TransactionFees);
  writeNotNull('GST', instance.GST);
  return val;
}
