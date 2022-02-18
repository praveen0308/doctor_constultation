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
        VideoCallDetailModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'CaseInfoID': instance.CaseInfoID,
      'ScheduledDateTime': instance.ScheduledDateTime,
      'ScheduledTimeInSecs': instance.ScheduledTimeInSecs,
      'ActualDateTime': instance.ActualDateTime,
      'ActualTimeInSecs': instance.ActualTimeInSecs,
      'MeetingID': instance.MeetingID,
      'MeetingPwd': instance.MeetingPwd,
      'CallType': instance.CallType,
      'PayLater': instance.PayLater,
      'IsPaymentInitiated': instance.IsPaymentInitiated,
      'IsPaymentDone': instance.IsPaymentDone,
      'IsCallStarted': instance.IsCallStarted,
      'IsCallDone': instance.IsCallDone,
      'IsCallExpired': instance.IsCallExpired,
      'PrescriptionPDF': instance.PrescriptionPDF,
      'PatientTokenID': instance.PatientTokenID,
      'DoctorTokenID': instance.DoctorTokenID,
      'SessionID': instance.SessionID,
      'ArchiveID': instance.ArchiveID,
    };
