// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAddressModel _$PatientAddressModelFromJson(Map<String, dynamic> json) =>
    PatientAddressModel(
      ID: json['ID'] as int? ?? 0,
      PatientID: json['PatientID'] as int? ?? 0,
      City: json['City'] as String? ?? "",
      State: json['State'] as String? ?? "",
      Country: json['Country'] as String? ?? "",
      AddressLine1: json['AddressLine1'] as String? ?? "",
      AddressLine2: json['AddressLine2'] as String? ?? "",
      AddressType: json['AddressType'] as int? ?? 0,
      PinCode: json['PinCode'] as int? ?? 0,
      AddedBy: json['AddedBy'] as int? ?? 0,
      AddedOn: json['AddedOn'] as String? ?? "",
      IsActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$PatientAddressModelToJson(
        PatientAddressModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'PatientID': instance.PatientID,
      'City': instance.City,
      'State': instance.State,
      'Country': instance.Country,
      'AddressLine1': instance.AddressLine1,
      'AddressLine2': instance.AddressLine2,
      'AddressType': instance.AddressType,
      'PinCode': instance.PinCode,
      'AddedBy': instance.AddedBy,
      'AddedOn': instance.AddedOn,
      'IsActive': instance.IsActive,
    };
