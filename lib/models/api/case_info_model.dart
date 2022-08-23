import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case_info_model.g.dart';

@JsonSerializable()
class CaseInfoModel {
  int ID;
  String CaseNo;
  int PatientInfoID;
  int DoctorID;
  int AppointmentID;
  String RecordDate;
  String LastModifiedDate;
  String ChiefComplaints;
  String PastHistory;
  String FamilyHistory;
  String PersonalHistory;
  String MenstObsHistory;
  String Pulse;
  String BP;
  String Temperature;
  String RespiratoryRate;
  String ClinicalObservations;
  String InvestigationNotes;
  String Diagnosis;

  CaseInfoModel(
      {this.ID = 0,
      this.CaseNo = "",
      this.PatientInfoID = 0,
      this.DoctorID=0,
      this.AppointmentID=0,
      this.RecordDate="",
      this.LastModifiedDate="",
      this.ChiefComplaints="",
      this.PastHistory="",
      this.FamilyHistory="",
      this.PersonalHistory="",
      this.MenstObsHistory="",
      this.Pulse="",
      this.BP="",
      this.Temperature="",
      this.RespiratoryRate="",
      this.ClinicalObservations="",
      this.InvestigationNotes="",
      this.Diagnosis=""});

  factory CaseInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CaseInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CaseInfoModelToJson(this);

  String getCaseDate() => DateFormat("dd MMM yyyy")
      .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(RecordDate));

  String getCaseTiming() => DateFormat("hh:mm a")
      .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(RecordDate));
}
