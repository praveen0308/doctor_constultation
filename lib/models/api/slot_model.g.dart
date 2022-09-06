// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotModel _$SlotModelFromJson(Map<String, dynamic> json) => SlotModel(
      ID: json['ID'] as int?,
      DayID: json['DayID'] as int?,
      BatchID: json['BatchID'] as int?,
      StartTime: json['StartTime'] as String?,
      EndTime: json['EndTime'] as String?,
      IsAvailable: json['IsAvailable'] as bool?,
      IsDisabled: json['IsDisabled'] as bool? ?? false,
    );

Map<String, dynamic> _$SlotModelToJson(SlotModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('DayID', instance.DayID);
  writeNotNull('BatchID', instance.BatchID);
  writeNotNull('StartTime', instance.StartTime);
  writeNotNull('EndTime', instance.EndTime);
  writeNotNull('IsAvailable', instance.IsAvailable);
  val['IsDisabled'] = instance.IsDisabled;
  return val;
}
