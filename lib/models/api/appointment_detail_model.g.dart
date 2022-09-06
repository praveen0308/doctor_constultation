// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDetailModel _$AppointmentDetailModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentDetailModel(
      AppointmentID: json['AppointmentID'] as int? ?? 0,
      MeetingID: json['MeetingID'] as String?,
      AppointmentNumber: json['AppointmentNumber'] as String? ?? "",
      DoctorID: json['DoctorID'] as int? ?? 0,
      PatientID: json['PatientID'] as int? ?? 0,
      PatientProfileUrl: json['PatientProfileUrl'] as String? ?? "",
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
      PaymentID: json['PaymentID'] as int? ?? 0,
      CaseID: json['CaseID'] as int? ?? 0,
      AddedBy: json['AddedBy'] as int? ?? 0,
      Addedon: json['Addedon'] as String? ?? "",
      RecordDate: json['RecordDate'] as String? ?? "",
      StartTime: json['StartTime'] as String? ?? "",
      EndTime: json['EndTime'] as String? ?? "",
      PatientName: json['PatientName'] as String? ?? "",
      UserAddress: json['UserAddress'] == null
          ? null
          : AddressModel.fromJson(json['UserAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentDetailModelToJson(
    AppointmentDetailModel instance) {
  final val = <String, dynamic>{
    'AppointmentID': instance.AppointmentID,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MeetingID', instance.MeetingID);
  val['AppointmentNumber'] = instance.AppointmentNumber;
  val['DoctorID'] = instance.DoctorID;
  val['PatientID'] = instance.PatientID;
  writeNotNull('PatientProfileUrl', instance.PatientProfileUrl);
  val['AddressID'] = instance.AddressID;
  val['Date'] = instance.Date;
  val['AppointmentStatusID'] = instance.AppointmentStatusID;
  val['Bill_Amount'] = instance.Bill_Amount;
  val['Bill_Status'] = instance.Bill_Status;
  val['DoctorNotification'] = instance.DoctorNotification;
  val['PatientNotification'] = instance.PatientNotification;
  val['FeedbackStatus'] = instance.FeedbackStatus;
  val['Disease'] = instance.Disease;
  val['Progress'] = instance.Progress;
  val['Prescription'] = instance.Prescription;
  val['ScheduleID'] = instance.ScheduleID;
  val['PaymentID'] = instance.PaymentID;
  val['CaseID'] = instance.CaseID;
  val['AddedBy'] = instance.AddedBy;
  val['Addedon'] = instance.Addedon;
  val['RecordDate'] = instance.RecordDate;
  val['StartTime'] = instance.StartTime;
  val['EndTime'] = instance.EndTime;
  val['PatientName'] = instance.PatientName;
  writeNotNull('UserAddress', instance.UserAddress?.toJson());
  return val;
}
