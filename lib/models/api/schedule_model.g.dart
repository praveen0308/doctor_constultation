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

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScheduleID', instance.ScheduleID);
  writeNotNull('ClinicID', instance.ClinicID);
  writeNotNull('ScheduleDate', instance.ScheduleDate);
  writeNotNull('ScheduleDayOfMonth', instance.ScheduleDayOfMonth);
  writeNotNull('ScheduleMonth', instance.ScheduleMonth);
  writeNotNull('ScheduleYear', instance.ScheduleYear);
  writeNotNull('DayID', instance.DayID);
  writeNotNull('DoctorID', instance.DoctorID);
  writeNotNull('StartTime', instance.StartTime);
  writeNotNull('EndTime', instance.EndTime);
  writeNotNull('ScheduleStatus', instance.ScheduleStatus);
  writeNotNull('IsCompleted', instance.IsCompleted);
  writeNotNull('IsCancel', instance.IsCancel);
  val['IsAvailable'] = instance.IsAvailable;
  val['IsBooked'] = instance.IsBooked;
  writeNotNull('AddenOn', instance.AddenOn);
  writeNotNull('AddedBy', instance.AddedBy);
  writeNotNull('IsModified', instance.IsModified);
  writeNotNull('ModifiedOn', instance.ModifiedOn);
  writeNotNull('ModifiedBy', instance.ModifiedBy);
  writeNotNull('IsActive', instance.IsActive);
  return val;
}
