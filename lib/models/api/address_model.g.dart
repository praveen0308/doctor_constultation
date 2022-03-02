// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      ID: json['ID'] as int? ?? 0,
      UserID: json['UserID'] as int? ?? 0,
      City: json['City'] as String? ?? "",
      LocationName: json['LocationName'] as String? ?? "",
      State: json['State'] as String? ?? "",
      Country: json['Country'] as String? ?? "",
      AddressLine1: json['AddressLine1'] as String? ?? "",
      AddressLine2: json['AddressLine2'] as String? ?? "",
      AddressType: json['AddressType'] as int? ?? 0,
      PinCode: json['PinCode'] as String? ?? "",
      AddedBy: json['AddedBy'] as int? ?? 0,
      AddedOn: json['AddedOn'] as String?,
      IsActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'UserID': instance.UserID,
      'City': instance.City,
      'LocationName': instance.LocationName,
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
