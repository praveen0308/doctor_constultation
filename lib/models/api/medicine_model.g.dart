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

Map<String, dynamic> _$MedicineModelToJson(MedicineModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('Brand', instance.Brand);
  writeNotNull('Generic', instance.Generic);
  return val;
}
