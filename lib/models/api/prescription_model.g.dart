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

Map<String, dynamic> _$PrescriptionModelToJson(PrescriptionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PrescriptionID', instance.PrescriptionID);
  writeNotNull('VideoCallID', instance.VideoCallID);
  writeNotNull('Advice', instance.Advice);
  writeNotNull('SugRegimen', instance.SugRegimen);
  writeNotNull('Investigations', instance.Investigations);
  writeNotNull('FollowupDays', instance.FollowupDays);
  return val;
}
