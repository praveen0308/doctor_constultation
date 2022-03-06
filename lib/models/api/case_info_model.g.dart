// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaseInfoModel _$CaseInfoModelFromJson(Map<String, dynamic> json) =>
    CaseInfoModel(
      ID: json['ID'] as int? ?? 0,
      CaseNo: json['CaseNo'] as String? ?? "",
      PatientInfoID: json['PatientInfoID'] as int? ?? 0,
      DoctorID: json['DoctorID'] as int? ?? 0,
      AppointmentID: json['AppointmentID'] as int? ?? 0,
      RecordDate: json['RecordDate'] as String? ?? "",
      LastModifiedDate: json['LastModifiedDate'] as String? ?? "",
      ChiefComplaints: json['ChiefComplaints'] as String? ?? "",
      PastHistory: json['PastHistory'] as String? ?? "",
      FamilyHistory: json['FamilyHistory'] as String? ?? "",
      PersonalHistory: json['PersonalHistory'] as String? ?? "",
      MenstObsHistory: json['MenstObsHistory'] as String? ?? "",
      Pulse: json['Pulse'] as String? ?? "",
      BP: json['BP'] as String? ?? "",
      Temperature: json['Temperature'] as String? ?? "",
      RespiratoryRate: json['RespiratoryRate'] as String? ?? "",
      ClinicalObservations: json['ClinicalObservations'] as String? ?? "",
      InvestigationNotes: json['InvestigationNotes'] as String? ?? "",
      Diagnosis: json['Diagnosis'] as String? ?? "",
    );

Map<String, dynamic> _$CaseInfoModelToJson(CaseInfoModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'CaseNo': instance.CaseNo,
      'PatientInfoID': instance.PatientInfoID,
      'DoctorID': instance.DoctorID,
      'AppointmentID': instance.AppointmentID,
      'RecordDate': instance.RecordDate,
      'LastModifiedDate': instance.LastModifiedDate,
      'ChiefComplaints': instance.ChiefComplaints,
      'PastHistory': instance.PastHistory,
      'FamilyHistory': instance.FamilyHistory,
      'PersonalHistory': instance.PersonalHistory,
      'MenstObsHistory': instance.MenstObsHistory,
      'Pulse': instance.Pulse,
      'BP': instance.BP,
      'Temperature': instance.Temperature,
      'RespiratoryRate': instance.RespiratoryRate,
      'ClinicalObservations': instance.ClinicalObservations,
      'InvestigationNotes': instance.InvestigationNotes,
      'Diagnosis': instance.Diagnosis,
    };
