// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineModel _$MedicineModelFromJson(Map<String, dynamic> json) =>
    MedicineModel(
      ID: json['ID'] as int?,
      Brand: json['Brand'] as String?,
      Generic: json['Generic'] as String?,
    );

Map<String, dynamic> _$MedicineModelToJson(MedicineModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'Brand': instance.Brand,
      'Generic': instance.Generic,
    };
