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

  SlotModel(
      {this.ID,
      this.DayID,
      this.BatchID,
      this.StartTime,
      this.EndTime,
      this.IsAvailable});

  factory SlotModel.fromJson(Map<String, dynamic> json) =>
      _$SlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlotModelToJson(this);
}
