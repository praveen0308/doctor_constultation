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
      PatientName: json['PatientName'] as String?,
      Name: json['Name'] as String?,
      UserID: json['UserID'] as int?,
      UserName: json['UserName'] as String?,
      PaymentAmount: (json['PaymentAmount'] as num?)?.toDouble(),
      Status: json['Status'] as String?,
      Message: json['Message'] as String?,
      IsRefunded: json['IsRefunded'] as bool?,
      RefundReason: json['RefundReason'] as String?,
      AddedOn: json['AddedOn'] as String?,
      RefundAmount: (json['RefundAmount'] as num?)?.toDouble(),
      IsPaid: json['IsPaid'] as bool?,
      IsCancel: json['IsCancel'] as bool?,
      PaymentDate: json['PaymentDate'] as String?,
      AppointmentNumber: json['AppointmentNumber'] as String?,
    );

Map<String, dynamic> _$PaymentTransactionModelToJson(
    PaymentTransactionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('PaymentID', instance.PaymentID);
  writeNotNull('OrderID', instance.OrderID);
  writeNotNull('CaseID', instance.CaseID);
  writeNotNull('PatientID', instance.PatientID);
  writeNotNull('PatientName', instance.PatientName);
  writeNotNull('UserID', instance.UserID);
  writeNotNull('UserName', instance.UserName);
  writeNotNull('Name', instance.Name);
  writeNotNull('PaymentAmount', instance.PaymentAmount);
  writeNotNull('Status', instance.Status);
  writeNotNull('Message', instance.Message);
  writeNotNull('AppointmentNumber', instance.AppointmentNumber);
  writeNotNull('IsRefunded', instance.IsRefunded);
  writeNotNull('RefundReason', instance.RefundReason);
  writeNotNull('AddedOn', instance.AddedOn);
  writeNotNull('RefundAmount', instance.RefundAmount);
  writeNotNull('IsPaid', instance.IsPaid);
  writeNotNull('IsCancel', instance.IsCancel);
  writeNotNull('PaymentDate', instance.PaymentDate);
  return val;
}
