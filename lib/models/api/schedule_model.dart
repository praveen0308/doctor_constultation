import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  int? ScheduleID;
  int? ClinicID;
  int? ScheduleDate;
  int? ScheduleDayOfMonth;
  int? ScheduleMonth;
  int? ScheduleYear;
  int? DayID;
  int? DoctorID;
  String? StartTime;
  String? EndTime;
  int? ScheduleStatus;
  bool? IsCompleted;
  bool? IsCancel;
  int? AddenOn;
  int? AddedBy;
  bool? IsModified;
  int? ModifiedOn;
  int? ModifiedBy;
  bool? IsActive;

  ScheduleModel({this.ScheduleID, this.ClinicID, this.ScheduleDate, this.ScheduleDayOfMonth, this.ScheduleMonth, this.ScheduleYear, this.DayID, this.DoctorID, this.StartTime, this.EndTime, this.ScheduleStatus, this.IsCompleted, this.IsCancel, this.AddenOn, this.AddedBy, this.IsModified, this.ModifiedOn, this.ModifiedBy, this.IsActive});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}

