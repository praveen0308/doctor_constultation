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

Map<String, dynamic> _$StatModelToJson(StatModel instance) => <String, dynamic>{
      'Patient': instance.Patient,
      'Users': instance.Users,
      'Appointment': instance.Appointment,
      'Video': instance.Video,
    };
