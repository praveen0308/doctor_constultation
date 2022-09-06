// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionMedicineModel _$PrescriptionMedicineModelFromJson(
        Map<String, dynamic> json) =>
    PrescriptionMedicineModel(
      ID: json['ID'] as int?,
      PrescriptionID: json['PrescriptionID'] as int?,
      Presentation: json['Presentation'] as String?,
      Brand: json['Brand'] as String?,
      Generic: json['Generic'] as String?,
      Strength: json['Strength'] as String?,
      Dosage: json['Dosage'] as String?,
      DosageInstructions: json['DosageInstructions'] as String?,
      DosageDuration: json['DosageDuration'] as String?,
      TotalQty: json['TotalQty'] as String?,
    );

Map<String, dynamic> _$PrescriptionMedicineModelToJson(
    PrescriptionMedicineModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('PrescriptionID', instance.PrescriptionID);
  writeNotNull('Presentation', instance.Presentation);
  writeNotNull('Brand', instance.Brand);
  writeNotNull('Generic', instance.Generic);
  writeNotNull('Strength', instance.Strength);
  writeNotNull('Dosage', instance.Dosage);
  writeNotNull('DosageInstructions', instance.DosageInstructions);
  writeNotNull('DosageDuration', instance.DosageDuration);
  writeNotNull('TotalQty', instance.TotalQty);
  return val;
}
