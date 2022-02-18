import 'package:json_annotation/json_annotation.dart';

part 'prescription_medicine_model.g.dart';

@JsonSerializable()
class PrescriptionMedicineModel {
  int? ID;
  int? PrescriptionID;
  String? Presentation;
  String? Brand;
  String? Generic;
  String? Strength;
  String? Dosage;
  String? DosageInstructions;
  String? DosageDuration;
  String? TotalQty;

  PrescriptionMedicineModel({this.ID, this.PrescriptionID, this.Presentation, this.Brand, this.Generic, this.Strength, this.Dosage, this.DosageInstructions, this.DosageDuration, this.TotalQty});

  factory PrescriptionMedicineModel.fromJson(Map<String, dynamic> json) => _$PrescriptionMedicineModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionMedicineModelToJson(this);
}

