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

Map<String, dynamic> _$PaymentOptionModelToJson(PaymentOptionModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'PaymentText': instance.PaymentText,
      'Amount': instance.Amount,
      'PackageTime': instance.PackageTime,
    };
