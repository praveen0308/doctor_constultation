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
        PrescriptionMedicineModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'PrescriptionID': instance.PrescriptionID,
      'Presentation': instance.Presentation,
      'Brand': instance.Brand,
      'Generic': instance.Generic,
      'Strength': instance.Strength,
      'Dosage': instance.Dosage,
      'DosageInstructions': instance.DosageInstructions,
      'DosageDuration': instance.DosageDuration,
      'TotalQty': instance.TotalQty,
    };
