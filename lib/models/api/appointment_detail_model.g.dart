// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDetailModel _$AppointmentDetailModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentDetailModel(
      AppointmentID: json['AppointmentID'] as int? ?? 0,
      AppointmentNumber: json['AppointmentNumber'] as String? ?? "",
      DoctorID: json['DoctorID'] as int? ?? 0,
      PatientID: json['PatientID'] as int? ?? 0,
      AddressID: json['AddressID'] as int? ?? 0,
      Date: json['Date'] as String? ?? "",
      AppointmentStatusID: json['AppointmentStatusID'] as int? ?? 0,
      Bill_Amount: (json['Bill_Amount'] as num?)?.toDouble() ?? 0,
      Bill_Status: json['Bill_Status'] as String? ?? "",
      DoctorNotification: json['DoctorNotification'] as int? ?? 0,
      PatientNotification: json['PatientNotification'] as int? ?? 0,
      FeedbackStatus: json['FeedbackStatus'] as int? ?? 0,
      Disease: json['Disease'] as String? ?? "",
      Progress: json['Progress'] as String? ?? "",
      Prescription: json['Prescription'] as String? ?? "",
      ScheduleID: json['ScheduleID'] as int? ?? 0,
      CaseID: json['CaseID'] as int? ?? 0,
      AddedBy: json['AddedBy'] as int? ?? 0,
      Addedon: json['Addedon'] as String? ?? "",
      StartTime: json['StartTime'] as String? ?? "",
      EndTime: json['EndTime'] as String? ?? "",
      PatientName: json['PatientName'] as String? ?? "",
      UserAddress: json['UserAddress'] == null
          ? null
          : AddressModel.fromJson(json['UserAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentDetailModelToJson(
        AppointmentDetailModel instance) =>
    <String, dynamic>{
      'AppointmentID': instance.AppointmentID,
      'AppointmentNumber': instance.AppointmentNumber,
      'DoctorID': instance.DoctorID,
      'PatientID': instance.PatientID,
      'AddressID': instance.AddressID,
      'Date': instance.Date,
      'AppointmentStatusID': instance.AppointmentStatusID,
      'Bill_Amount': instance.Bill_Amount,
      'Bill_Status': instance.Bill_Status,
      'DoctorNotification': instance.DoctorNotification,
      'PatientNotification': instance.PatientNotification,
      'FeedbackStatus': instance.FeedbackStatus,
      'Disease': instance.Disease,
      'Progress': instance.Progress,
      'Prescription': instance.Prescription,
      'ScheduleID': instance.ScheduleID,
      'CaseID': instance.CaseID,
      'AddedBy': instance.AddedBy,
      'Addedon': instance.Addedon,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'PatientName': instance.PatientName,
      'UserAddress': instance.UserAddress,
    };
