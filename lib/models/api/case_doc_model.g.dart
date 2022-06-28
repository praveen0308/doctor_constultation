// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_doc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaseDocModel _$CaseDocModelFromJson(Map<String, dynamic> json) => CaseDocModel(
      ID: json['ID'] as int?,
      CaseInfoID: json['CaseInfoID'] as int?,
      FileName: json['FileName'] as String?,
      FilePath: json['FilePath'] as String?,
      Type: json['Type'] as int?,
      Extension: json['Extension'] as String?,
      UploadedOn: json['UploadedOn'] as String?,
      Details: json['Details'] as String?,
      IsAllowedToDoc: json['IsAllowedToDoc'] as bool?,
    );

Map<String, dynamic> _$CaseDocModelToJson(CaseDocModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'CaseInfoID': instance.CaseInfoID,
      'FileName': instance.FileName,
      'FilePath': instance.FilePath,
      'Type': instance.Type,
      'Extension': instance.Extension,
      'UploadedOn': instance.UploadedOn,
      'Details': instance.Details,
      'IsAllowedToDoc': instance.IsAllowedToDoc,
    };
