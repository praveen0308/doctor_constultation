import 'package:json_annotation/json_annotation.dart';

part 'dosage_model.g.dart';

@JsonSerializable()
class DosageModel {
  int? ID;
  String? Value;

  DosageModel({this.ID, this.Value});

  factory DosageModel.fromJson(Map<String, dynamic> json) => _$DosageModelFromJson(json);

  Map<String, dynamic> toJson() => _$DosageModelToJson(this);
}

