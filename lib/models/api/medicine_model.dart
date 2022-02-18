import 'package:json_annotation/json_annotation.dart';

part 'medicine_model.g.dart';

@JsonSerializable()
class MedicineModel {
  int? ID;
  String? Brand;
  String? Generic;

  MedicineModel({this.ID, this.Brand, this.Generic});

  factory MedicineModel.fromJson(Map<String, dynamic> json) => _$MedicineModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineModelToJson(this);
}

