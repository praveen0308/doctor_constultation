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

Map<String, dynamic> _$CaseDocModelToJson(CaseDocModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('CaseInfoID', instance.CaseInfoID);
  writeNotNull('FileName', instance.FileName);
  writeNotNull('FilePath', instance.FilePath);
  writeNotNull('Type', instance.Type);
  writeNotNull('Extension', instance.Extension);
  writeNotNull('UploadedOn', instance.UploadedOn);
  writeNotNull('Details', instance.Details);
  writeNotNull('IsAllowedToDoc', instance.IsAllowedToDoc);
  return val;
}
