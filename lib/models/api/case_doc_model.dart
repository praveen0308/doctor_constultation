import 'package:doctor_consultation/network/utils/api_constats.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case_doc_model.g.dart';

@JsonSerializable()
class CaseDocModel {
  int? ID;
  int? CaseInfoID;
  String? FileName;
  String? FilePath;
  int? Type;
  String? Extension;
  String? UploadedOn;
  String? Details;
  bool? IsAllowedToDoc;

  CaseDocModel({this.ID, this.CaseInfoID, this.FileName,this.FilePath, this.Type, this.Extension, this.UploadedOn, this.Details, this.IsAllowedToDoc});

  factory CaseDocModel.fromJson(Map<String, dynamic> json) => _$CaseDocModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaseDocModelToJson(this);

  String getDocUrl() => "${ApiConstants.baseUrl}$FilePath";
}

