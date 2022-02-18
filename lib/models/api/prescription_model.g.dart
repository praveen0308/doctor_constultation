// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionModel _$PrescriptionModelFromJson(Map<String, dynamic> json) =>
    PrescriptionModel(
      PrescriptionID: json['PrescriptionID'] as int?,
      VideoCallID: json['VideoCallID'] as int?,
      Advice: json['Advice'] as String?,
      SugRegimen: json['SugRegimen'] as String?,
      Investigations: json['Investigations'] as String?,
      FollowupDays: json['FollowupDays'] as String?,
    );

Map<String, dynamic> _$PrescriptionModelToJson(PrescriptionModel instance) =>
    <String, dynamic>{
      'PrescriptionID': instance.PrescriptionID,
      'VideoCallID': instance.VideoCallID,
      'Advice': instance.Advice,
      'SugRegimen': instance.SugRegimen,
      'Investigations': instance.Investigations,
      'FollowupDays': instance.FollowupDays,
    };
