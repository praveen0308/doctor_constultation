import 'package:json_annotation/json_annotation.dart';

part 'video_call_detail_model.g.dart';

@JsonSerializable()
class VideoCallDetailModel {
  int? ID;
  int? CaseInfoID;
  int? ScheduledDateTime;
  int? ScheduledTimeInSecs;
  int? ActualDateTime;
  int? ActualTimeInSecs;
  String? MeetingID;
  String? MeetingPwd;
  String? CallType;
  bool? PayLater;
  bool? IsPaymentInitiated;
  bool? IsPaymentDone;
  bool? IsCallStarted;
  bool? IsCallDone;
  bool? IsCallExpired;
  String? PrescriptionPDF;
  String? PatientTokenID;
  String? DoctorTokenID;
  String? SessionID;
  String? ArchiveID;

  VideoCallDetailModel({this.ID, this.CaseInfoID, this.ScheduledDateTime, this.ScheduledTimeInSecs, this.ActualDateTime, this.ActualTimeInSecs, this.MeetingID, this.MeetingPwd, this.CallType, this.PayLater, this.IsPaymentInitiated, this.IsPaymentDone, this.IsCallStarted, this.IsCallDone, this.IsCallExpired, this.PrescriptionPDF, this.PatientTokenID, this.DoctorTokenID, this.SessionID, this.ArchiveID});

  factory VideoCallDetailModel.fromJson(Map<String, dynamic> json) => _$VideoCallDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCallDetailModelToJson(this);
}

