// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_prescribed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicinePrescribedModel _$MedicinePrescribedModelFromJson(
        Map<String, dynamic> json) =>
    MedicinePrescribedModel(
      medid: json['medid'] as int?,
      caseno: json['caseno'] as String?,
      gv: json['gv'] as String?,
      brand: json['brand'] as String?,
      generic: json['generic'] as String?,
      strg: json['strg'] as String?,
      dos: json['dos'] as String?,
      ins: json['ins'] as String?,
      dur: json['dur'] as String?,
      quan: json['quan'] as String?,
      ing: json['ing'] as String?,
      fwid: json['fwid'] as String?,
    );

Map<String, dynamic> _$MedicinePrescribedModelToJson(
        MedicinePrescribedModel instance) =>
    <String, dynamic>{
      'medid': instance.medid,
      'caseno': instance.caseno,
      'gv': instance.gv,
      'brand': instance.brand,
      'generic': instance.generic,
      'strg': instance.strg,
      'dos': instance.dos,
      'ins': instance.ins,
      'dur': instance.dur,
      'quan': instance.quan,
      'ing': instance.ing,
      'fwid': instance.fwid,
    };
