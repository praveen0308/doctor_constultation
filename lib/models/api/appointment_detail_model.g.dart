// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDetailModel _$AppointmentDetailModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentDetailModel(
      AppointID: json['AppointID'] as int?,
      DoctorID: json['DoctorID'] as int?,
      PatientID: json['PatientID'] as int?,
      Date: json['Date'] as int?,
      Appointment_Status: json['Appointment_Status'] as int?,
      Bill_Amount: json['Bill_Amount'] as int?,
      Bill_Status: json['Bill_Status'] as String?,
      DoctorNotification: json['DoctorNotification'] as int?,
      PatientNotification: json['PatientNotification'] as int?,
      FeedbackStatus: json['FeedbackStatus'] as int?,
      Disease: json['Disease'] as String?,
      Progress: json['Progress'] as String?,
      Prescription: json['Prescription'] as String?,
    );

Map<String, dynamic> _$AppointmentDetailModelToJson(
        AppointmentDetailModel instance) =>
    <String, dynamic>{
      'AppointID': instance.AppointID,
      'DoctorID': instance.DoctorID,
      'PatientID': instance.PatientID,
      'Date': instance.Date,
      'Appointment_Status': instance.Appointment_Status,
      'Bill_Amount': instance.Bill_Amount,
      'Bill_Status': instance.Bill_Status,
      'DoctorNotification': instance.DoctorNotification,
      'PatientNotification': instance.PatientNotification,
      'FeedbackStatus': instance.FeedbackStatus,
      'Disease': instance.Disease,
      'Progress': instance.Progress,
      'Prescription': instance.Prescription,
    };
