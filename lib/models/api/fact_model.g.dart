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

Map<String, dynamic> _$FactModelToJson(FactModel instance) => <String, dynamic>{
      'FactID': instance.FactID,
      'DoctorID': instance.DoctorID,
      'Title': instance.Title,
      'Description': instance.Description,
      'AddedBy': instance.AddedBy,
      'AddedOn': instance.AddedOn,
      'ModifiedBy': instance.ModifiedBy,
      'ModifiedOn': instance.ModifiedOn,
      'IsActive': instance.IsActive,
    };
