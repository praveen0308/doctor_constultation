import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_detail_model.g.dart';

@JsonSerializable()
class AppointmentDetailModel {
  int AppointmentID;
  int DoctorID;
  int PatientID;
  int AddressID;
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
  AddressModel? UserAddress;

  AppointmentDetailModel({
    this.AppointmentID = 0,
    this.DoctorID = 0,
    this.PatientID = 0,
    this.AddressID = 0,
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
    this.UserAddress,
  });

  factory AppointmentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailModelToJson(this);

  String getFStartTime() =>
      DateFormat.jm().format(DateFormat("HH:mm").parse(StartTime));
  String getFEndTime() =>
      DateFormat.jm().format(DateFormat("HH:mm").parse(EndTime));

  String getTiming() => "${getFStartTime()} - ${getFEndTime()}";
  String getAppointmentDate() => DateFormat("dd MMM yy").format(DateFormat("yyyy-mm-dd'T'hh:mm:ss").parse(Date));
  String getAppointmentStats(){
    var status = "Pending";
    switch(Appointment_Status){
      case AppConstants.pending:status = "Pending";break;
      case AppConstants.approved:status = "Approved";break;
      case AppConstants.cancelled:status = "Cancelled";break;
      case AppConstants.ongoing:status = "Ongoing";break;
      case AppConstants.closed:status = "Closed";break;
    }
    return status;
  }
}
