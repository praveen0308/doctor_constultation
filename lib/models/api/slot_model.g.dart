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
    );

Map<String, dynamic> _$SlotModelToJson(SlotModel instance) => <String, dynamic>{
      'ID': instance.ID,
      'DayID': instance.DayID,
      'BatchID': instance.BatchID,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'IsAvailable': instance.IsAvailable,
    };
