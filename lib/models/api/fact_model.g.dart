// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactModel _$FactModelFromJson(Map<String, dynamic> json) => FactModel(
      FactID: json['FactID'] as int?,
      DoctorID: json['DoctorID'] as int?,
      Title: json['Title'] as String?,
      Description: json['Description'] as String?,
      AddedBy: json['AddedBy'] as int?,
      AddedOn: json['AddedOn'] as String?,
      ModifiedBy: json['ModifiedBy'] as int?,
      ModifiedOn: json['ModifiedOn'] as String?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$FactModelToJson(FactModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FactID', instance.FactID);
  writeNotNull('DoctorID', instance.DoctorID);
  writeNotNull('Title', instance.Title);
  writeNotNull('Description', instance.Description);
  writeNotNull('AddedBy', instance.AddedBy);
  writeNotNull('AddedOn', instance.AddedOn);
  writeNotNull('ModifiedBy', instance.ModifiedBy);
  writeNotNull('ModifiedOn', instance.ModifiedOn);
  writeNotNull('IsActive', instance.IsActive);
  return val;
}
