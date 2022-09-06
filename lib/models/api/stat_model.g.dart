// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatModel _$StatModelFromJson(Map<String, dynamic> json) => StatModel(
      Patient: json['Patient'] as int?,
      Users: json['Users'] as int?,
      Appointment: json['Appointment'] as int?,
      Video: json['Video'] as int?,
    );

Map<String, dynamic> _$StatModelToJson(StatModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Patient', instance.Patient);
  writeNotNull('Users', instance.Users);
  writeNotNull('Appointment', instance.Appointment);
  writeNotNull('Video', instance.Video);
  return val;
}
