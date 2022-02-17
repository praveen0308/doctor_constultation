import 'package:json_annotation/json_annotation.dart';

part 'fact_model.g.dart';

@JsonSerializable()
class FactModel {
  int? FactID;
  int? DoctorID;
  String? Title;
  String? Description;
  int? AddedBy;
  String? AddedOn;
  int? ModifiedBy;
  String? ModifiedOn;
  bool? IsActive;

  FactModel(
      {this.FactID,
      this.DoctorID,
      this.Title,
      this.Description,
      this.AddedBy,
      this.AddedOn,
      this.ModifiedBy,
      this.ModifiedOn,
      this.IsActive});

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}
