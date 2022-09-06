// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dosage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DosageModel _$DosageModelFromJson(Map<String, dynamic> json) => DosageModel(
      ID: json['ID'] as int?,
      Value: json['Value'] as String?,
    );

Map<String, dynamic> _$DosageModelToJson(DosageModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('Value', instance.Value);
  return val;
}
