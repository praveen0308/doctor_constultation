import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slot_model.g.dart';

@JsonSerializable()
class SlotModel {
  int? ID;
  int? DayID;
  int? BatchID;
  String? StartTime;
  String? EndTime;
  bool? IsAvailable;
  bool IsDisabled=false;

  SlotModel(
      {this.ID,
      this.DayID,
      this.BatchID,
      this.StartTime,
      this.EndTime,
      this.IsAvailable,
      this.IsDisabled=false});

  factory SlotModel.fromJson(Map<String, dynamic> json) =>
      _$SlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlotModelToJson(this);

  String getFStartTime() =>
      DateFormat.jm().format(DateFormat("HH:mm:ss").parse(StartTime!));
  String getFEndTime() =>
      DateFormat.jm().format(DateFormat("HH:mm:ss").parse(EndTime!));

  String getTiming() => "${getFStartTime()} - ${getFEndTime()}";
}
