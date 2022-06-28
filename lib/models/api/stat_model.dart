import 'package:json_annotation/json_annotation.dart';

part 'stat_model.g.dart';

@JsonSerializable()
class StatModel {
  int? Patient;
  int? Users;
  int? Appointment;
  int? Video;

  StatModel({this.Patient, this.Users, this.Appointment, this.Video});

  factory StatModel.fromJson(Map<String, dynamic> json) => _$StatModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatModelToJson(this);
}

