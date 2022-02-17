import 'package:json_annotation/json_annotation.dart';

part 'doctor_detail_model.g.dart';

@JsonSerializable()
class DoctorDetailModel {
  int? ID;
  int? UserID;
  bool? LiteAccount;
  String? Name;
  String? RegistrationNo;
  String? Qualifications;
  String? Address;
  String? EmailID;
  String? ContactNo;
  String? MeetingPwd;
  int? PresSrNo;
  String? SessionId;
  int? TotalTimeSecs;
  int? TotalTimeSecsLeft;
  int? ConsultingFees;
  String? Signature;
  String? ContentType;
  String? AcHolderName;
  String? AcNumber;
  String? IfscCode;

  DoctorDetailModel(
      {this.ID,
      this.UserID,
      this.LiteAccount,
      this.Name,
      this.RegistrationNo,
      this.Qualifications,
      this.Address,
      this.EmailID,
      this.ContactNo,
      this.MeetingPwd,
      this.PresSrNo,
      this.SessionId,
      this.TotalTimeSecs,
      this.TotalTimeSecsLeft,
      this.ConsultingFees,
      this.Signature,
      this.ContentType,
      this.AcHolderName,
      this.AcNumber,
      this.IfscCode});

  factory DoctorDetailModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailModelToJson(this);
}
