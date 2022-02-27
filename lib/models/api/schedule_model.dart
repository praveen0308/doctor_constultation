import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  int? ScheduleID;
  int? ClinicID;
  String? ScheduleDate;
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
  bool? IsAvailable;
  String? AddenOn;
  int? AddedBy;
  bool? IsModified;
  String? ModifiedOn;
  int? ModifiedBy;
  bool? IsActive;

  ScheduleModel(
      {this.ScheduleID,
      this.ClinicID,
      this.ScheduleDate,
      this.ScheduleDayOfMonth,
      this.ScheduleMonth,
      this.ScheduleYear,
      this.DayID,
      this.DoctorID,
      this.StartTime,
      this.EndTime,
      this.ScheduleStatus,
      this.IsCompleted,
      this.IsCancel,
      this.IsAvailable,
      this.AddenOn,
      this.AddedBy,
      this.IsModified,
      this.ModifiedOn,
      this.ModifiedBy,
      this.IsActive});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
  String getFStartTime() =>
      DateFormat.jm().format(DateFormat("HH:mm").parse(StartTime!));
  String getFEndTime() =>
      DateFormat.jm().format(DateFormat("HH:mm").parse(EndTime!));

  String getTiming() => "${getFStartTime()} - ${getFEndTime()}";
  SlotModel toSlotMode() => SlotModel(
      StartTime: StartTime, EndTime: EndTime, IsAvailable: IsAvailable);
}
