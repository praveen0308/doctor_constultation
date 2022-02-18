import 'package:json_annotation/json_annotation.dart';

part 'case_info_model.g.dart';

@JsonSerializable()
class CaseInfoModel {
  int? ID;
  String? CaseNo;
  int? PatientInfoID;
  int? DoctorID;
  int? RecordDate;
  int? LastModifiedDate;
  String? ChiefComplaints;
  String? PastHistory;
  String? FamilyHistory;
  String? PersonalHistory;
  String? MenstObsHistory;
  String? Pulse;
  String? BP;
  String? Temperature;
  String? RespiratoryRate;
  String? ClinicalObservations;
  String? InvestigationNotes;
  String? Diagnosis;

  CaseInfoModel({this.ID, this.CaseNo, this.PatientInfoID, this.DoctorID, this.RecordDate, this.LastModifiedDate, this.ChiefComplaints, this.PastHistory, this.FamilyHistory, this.PersonalHistory, this.MenstObsHistory, this.Pulse, this.BP, this.Temperature, this.RespiratoryRate, this.ClinicalObservations, this.InvestigationNotes, this.Diagnosis});

  factory CaseInfoModel.fromJson(Map<String, dynamic> json) => _$CaseInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaseInfoModelToJson(this);
}

