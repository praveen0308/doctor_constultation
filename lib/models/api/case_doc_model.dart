import 'package:json_annotation/json_annotation.dart';

part 'case_doc_model.g.dart';

@JsonSerializable()
class CaseDocModel {
  int? ID;
  int? CaseInfoID;
  String? FileName;
  int? Type;
  String? Extension;
  int? UploadedOn;
  String? Details;
  bool? IsAllowedToDoc;

  CaseDocModel({this.ID, this.CaseInfoID, this.FileName, this.Type, this.Extension, this.UploadedOn, this.Details, this.IsAllowedToDoc});

  factory CaseDocModel.fromJson(Map<String, dynamic> json) => _$CaseDocModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaseDocModelToJson(this);
}

