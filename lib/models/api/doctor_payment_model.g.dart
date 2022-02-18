// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorPaymentModel _$DoctorPaymentModelFromJson(Map<String, dynamic> json) =>
    DoctorPaymentModel(
      ID: json['ID'] as int?,
      DoctorInfoID: json['DoctorInfoID'] as int?,
      PaymentID: json['PaymentID'] as String?,
      PaymentRequestID: json['PaymentRequestID'] as String?,
      Amount: json['Amount'] as int?,
      TransactionFees: json['TransactionFees'] as int?,
      GST: json['GST'] as int?,
      PaymentStatus: json['PaymentStatus'] as String?,
      PurchaseDate: json['PurchaseDate'] as int?,
      PackageSeconds: json['PackageSeconds'] as int?,
      PackageStatus: json['PackageStatus'] as int?,
      LongURL: json['LongURL'] as String?,
      PackageText: json['PackageText'] as String?,
      RepayAttempts: json['RepayAttempts'] as int?,
    );

Map<String, dynamic> _$DoctorPaymentModelToJson(DoctorPaymentModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'DoctorInfoID': instance.DoctorInfoID,
      'PaymentID': instance.PaymentID,
      'PaymentRequestID': instance.PaymentRequestID,
      'Amount': instance.Amount,
      'TransactionFees': instance.TransactionFees,
      'GST': instance.GST,
      'PaymentStatus': instance.PaymentStatus,
      'PurchaseDate': instance.PurchaseDate,
      'PackageSeconds': instance.PackageSeconds,
      'PackageStatus': instance.PackageStatus,
      'LongURL': instance.LongURL,
      'PackageText': instance.PackageText,
      'RepayAttempts': instance.RepayAttempts,
    };
