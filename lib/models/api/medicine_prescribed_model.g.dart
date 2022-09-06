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
    MedicinePrescribedModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('medid', instance.medid);
  writeNotNull('caseno', instance.caseno);
  writeNotNull('gv', instance.gv);
  writeNotNull('brand', instance.brand);
  writeNotNull('generic', instance.generic);
  writeNotNull('strg', instance.strg);
  writeNotNull('dos', instance.dos);
  writeNotNull('ins', instance.ins);
  writeNotNull('dur', instance.dur);
  writeNotNull('quan', instance.quan);
  writeNotNull('ing', instance.ing);
  writeNotNull('fwid', instance.fwid);
  return val;
}
