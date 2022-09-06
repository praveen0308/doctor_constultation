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

Map<String, dynamic> _$DoctorPaymentModelToJson(DoctorPaymentModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('DoctorInfoID', instance.DoctorInfoID);
  writeNotNull('PaymentID', instance.PaymentID);
  writeNotNull('PaymentRequestID', instance.PaymentRequestID);
  writeNotNull('Amount', instance.Amount);
  writeNotNull('TransactionFees', instance.TransactionFees);
  writeNotNull('GST', instance.GST);
  writeNotNull('PaymentStatus', instance.PaymentStatus);
  writeNotNull('PurchaseDate', instance.PurchaseDate);
  writeNotNull('PackageSeconds', instance.PackageSeconds);
  writeNotNull('PackageStatus', instance.PackageStatus);
  writeNotNull('LongURL', instance.LongURL);
  writeNotNull('PackageText', instance.PackageText);
  writeNotNull('RepayAttempts', instance.RepayAttempts);
  return val;
}
