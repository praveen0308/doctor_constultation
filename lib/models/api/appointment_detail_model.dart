import 'package:json_annotation/json_annotation.dart';

part 'appointment_detail_model.g.dart';

@JsonSerializable()
class AppointmentDetailModel {
  int AppointID;
  int DoctorID;
  int PatientID;
  String Date;
  int Appointment_Status;
  double Bill_Amount;
  String Bill_Status;
  int DoctorNotification;
  int PatientNotification;
  int FeedbackStatus;
  String Disease;
  String Progress;
  String Prescription;
  int ScheduleID;
  int CaseID;
  int AddedBy;
  String Addedon;
  String StartTime;
  String EndTime;
  String PatientName;

  AppointmentDetailModel({
    this.AppointID = 0,
    this.DoctorID = 0,
    this.PatientID = 0,
    this.Date = "",
    this.Appointment_Status = 0,
    this.Bill_Amount = 0,
    this.Bill_Status = "",
    this.DoctorNotification = 0,
    this.PatientNotification = 0,
    this.FeedbackStatus = 0,
    this.Disease = "",
    this.Progress = "",
    this.Prescription = "",
    this.ScheduleID = 0,
    this.CaseID = 0,
    this.AddedBy = 0,
    this.Addedon = "",
    this.StartTime = "",
    this.EndTime = "",
    this.PatientName = "",
  });

  factory AppointmentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailModelToJson(this);
}
