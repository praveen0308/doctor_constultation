import 'package:json_annotation/json_annotation.dart';

part 'appointment_detail_model.g.dart';

@JsonSerializable()
class AppointmentDetailModel {
  int? AppointID;
  int? DoctorID;
  int? PatientID;
  int? Date;
  int? Appointment_Status;
  int? Bill_Amount;
  String? Bill_Status;
  int? DoctorNotification;
  int? PatientNotification;
  int? FeedbackStatus;
  String? Disease;
  String? Progress;
  String? Prescription;

  AppointmentDetailModel({this.AppointID, this.DoctorID, this.PatientID, this.Date, this.Appointment_Status, this.Bill_Amount, this.Bill_Status, this.DoctorNotification, this.PatientNotification, this.FeedbackStatus, this.Disease, this.Progress, this.Prescription});

  factory AppointmentDetailModel.fromJson(Map<String, dynamic> json) => _$AppointmentDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailModelToJson(this);
}

