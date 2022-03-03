// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      ScheduleID: json['ScheduleID'] as int?,
      ClinicID: json['ClinicID'] as int?,
      ScheduleDate: json['ScheduleDate'] as String?,
      ScheduleDayOfMonth: json['ScheduleDayOfMonth'] as int?,
      ScheduleMonth: json['ScheduleMonth'] as int?,
      ScheduleYear: json['ScheduleYear'] as int?,
      DayID: json['DayID'] as int?,
      DoctorID: json['DoctorID'] as int?,
      StartTime: json['StartTime'] as String?,
      EndTime: json['EndTime'] as String?,
      ScheduleStatus: json['ScheduleStatus'] as int?,
      IsCompleted: json['IsCompleted'] as bool?,
      IsCancel: json['IsCancel'] as bool?,
      IsAvailable: json['IsAvailable'] as bool? ?? false,
      IsBooked: json['IsBooked'] as bool? ?? false,
      AddenOn: json['AddenOn'] as String?,
      AddedBy: json['AddedBy'] as int?,
      IsModified: json['IsModified'] as bool?,
      ModifiedOn: json['ModifiedOn'] as String?,
      ModifiedBy: json['ModifiedBy'] as int?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'ScheduleID': instance.ScheduleID,
      'ClinicID': instance.ClinicID,
      'ScheduleDate': instance.ScheduleDate,
      'ScheduleDayOfMonth': instance.ScheduleDayOfMonth,
      'ScheduleMonth': instance.ScheduleMonth,
      'ScheduleYear': instance.ScheduleYear,
      'DayID': instance.DayID,
      'DoctorID': instance.DoctorID,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'ScheduleStatus': instance.ScheduleStatus,
      'IsCompleted': instance.IsCompleted,
      'IsCancel': instance.IsCancel,
      'IsAvailable': instance.IsAvailable,
      'IsBooked': instance.IsBooked,
      'AddenOn': instance.AddenOn,
      'AddedBy': instance.AddedBy,
      'IsModified': instance.IsModified,
      'ModifiedOn': instance.ModifiedOn,
      'ModifiedBy': instance.ModifiedBy,
      'IsActive': instance.IsActive,
    };
