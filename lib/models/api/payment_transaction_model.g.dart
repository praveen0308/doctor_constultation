// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTransactionModel _$PaymentTransactionModelFromJson(
        Map<String, dynamic> json) =>
    PaymentTransactionModel(
      ID: json['ID'] as int?,
      PaymentID: json['PaymentID'] as String?,
      OrderID: json['OrderID'] as String?,
      CaseID: json['CaseID'] as int?,
      PatientID: json['PatientID'] as int?,
      Name: json['Name'] as String?,
      UserID: json['UserID'] as int?,
      PaymentAmount: (json['PaymentAmount'] as num?)?.toDouble(),
      Status: json['Status'] as String?,
      Message: json['Message'] as String?,
      IsRefunded: json['IsRefunded'] as bool?,
      RefundReason: json['RefundReason'] as String?,
      AddedOn: json['AddedOn'] as String?,
      RefundAmount: (json['RefundAmount'] as num?)?.toDouble(),
      IsPaid: json['IsPaid'] as bool?,
      IsCancel: json['IsCancel'] as bool?,
    );

Map<String, dynamic> _$PaymentTransactionModelToJson(
        PaymentTransactionModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'PaymentID': instance.PaymentID,
      'OrderID': instance.OrderID,
      'CaseID': instance.CaseID,
      'PatientID': instance.PatientID,
      'Name': instance.Name,
      'UserID': instance.UserID,
      'PaymentAmount': instance.PaymentAmount,
      'Status': instance.Status,
      'Message': instance.Message,
      'IsRefunded': instance.IsRefunded,
      'RefundReason': instance.RefundReason,
      'AddedOn': instance.AddedOn,
      'RefundAmount': instance.RefundAmount,
      'IsPaid': instance.IsPaid,
      'IsCancel': instance.IsCancel,
    };
