// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCallDetailModel _$VideoCallDetailModelFromJson(
        Map<String, dynamic> json) =>
    VideoCallDetailModel(
      ID: json['ID'] as int?,
      CaseInfoID: json['CaseInfoID'] as int?,
      ScheduledDateTime: json['ScheduledDateTime'] as int?,
      ScheduledTimeInSecs: json['ScheduledTimeInSecs'] as int?,
      ActualDateTime: json['ActualDateTime'] as int?,
      ActualTimeInSecs: json['ActualTimeInSecs'] as int?,
      MeetingID: json['MeetingID'] as String?,
      MeetingPwd: json['MeetingPwd'] as String?,
      CallType: json['CallType'] as String?,
      PayLater: json['PayLater'] as bool?,
      IsPaymentInitiated: json['IsPaymentInitiated'] as bool?,
      IsPaymentDone: json['IsPaymentDone'] as bool?,
      IsCallStarted: json['IsCallStarted'] as bool?,
      IsCallDone: json['IsCallDone'] as bool?,
      IsCallExpired: json['IsCallExpired'] as bool?,
      PrescriptionPDF: json['PrescriptionPDF'] as String?,
      PatientTokenID: json['PatientTokenID'] as String?,
      DoctorTokenID: json['DoctorTokenID'] as String?,
      SessionID: json['SessionID'] as String?,
      ArchiveID: json['ArchiveID'] as String?,
    );

Map<String, dynamic> _$VideoCallDetailModelToJson(
    VideoCallDetailModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('CaseInfoID', instance.CaseInfoID);
  writeNotNull('ScheduledDateTime', instance.ScheduledDateTime);
  writeNotNull('ScheduledTimeInSecs', instance.ScheduledTimeInSecs);
  writeNotNull('ActualDateTime', instance.ActualDateTime);
  writeNotNull('ActualTimeInSecs', instance.ActualTimeInSecs);
  writeNotNull('MeetingID', instance.MeetingID);
  writeNotNull('MeetingPwd', instance.MeetingPwd);
  writeNotNull('CallType', instance.CallType);
  writeNotNull('PayLater', instance.PayLater);
  writeNotNull('IsPaymentInitiated', instance.IsPaymentInitiated);
  writeNotNull('IsPaymentDone', instance.IsPaymentDone);
  writeNotNull('IsCallStarted', instance.IsCallStarted);
  writeNotNull('IsCallDone', instance.IsCallDone);
  writeNotNull('IsCallExpired', instance.IsCallExpired);
  writeNotNull('PrescriptionPDF', instance.PrescriptionPDF);
  writeNotNull('PatientTokenID', instance.PatientTokenID);
  writeNotNull('DoctorTokenID', instance.DoctorTokenID);
  writeNotNull('SessionID', instance.SessionID);
  writeNotNull('ArchiveID', instance.ArchiveID);
  return val;
}
