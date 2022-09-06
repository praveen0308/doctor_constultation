// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOptionModel _$PaymentOptionModelFromJson(Map<String, dynamic> json) =>
    PaymentOptionModel(
      ID: json['ID'] as int?,
      PaymentText: json['PaymentText'] as String?,
      Amount: json['Amount'] as int?,
      PackageTime: json['PackageTime'] as int?,
    );

Map<String, dynamic> _$PaymentOptionModelToJson(PaymentOptionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('PaymentText', instance.PaymentText);
  writeNotNull('Amount', instance.Amount);
  writeNotNull('PackageTime', instance.PackageTime);
  return val;
}
