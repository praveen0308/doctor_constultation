import 'package:json_annotation/json_annotation.dart';

part 'medicine_prescribed_model.g.dart';

@JsonSerializable()
class MedicinePrescribedModel {
  int? medid;
  String? caseno;
  String? gv;
  String? brand;
  String? generic;
  String? strg;
  String? dos;
  String? ins;
  String? dur;
  String? quan;
  String? ing;
  String? fwid;

  MedicinePrescribedModel({this.medid, this.caseno, this.gv, this.brand, this.generic, this.strg, this.dos, this.ins, this.dur, this.quan, this.ing, this.fwid});

  factory MedicinePrescribedModel.fromJson(Map<String, dynamic> json) => _$MedicinePrescribedModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicinePrescribedModelToJson(this);
}

