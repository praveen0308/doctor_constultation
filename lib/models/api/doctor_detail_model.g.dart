// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDetailModel _$DoctorDetailModelFromJson(Map<String, dynamic> json) =>
    DoctorDetailModel(
      ID: json['ID'] as int?,
      UserID: json['UserID'] as int?,
      LiteAccount: json['LiteAccount'] as bool?,
      Name: json['Name'] as String?,
      RegistrationNo: json['RegistrationNo'] as String?,
      Qualifications: json['Qualifications'] as String?,
      Address: json['Address'] as String?,
      EmailID: json['EmailID'] as String?,
      ContactNo: json['ContactNo'] as String?,
      MeetingPwd: json['MeetingPwd'] as String?,
      PresSrNo: json['PresSrNo'] as int?,
      SessionId: json['SessionId'] as String?,
      TotalTimeSecs: json['TotalTimeSecs'] as int?,
      TotalTimeSecsLeft: json['TotalTimeSecsLeft'] as int?,
      ConsultingFees: json['ConsultingFees'] as int?,
      Signature: json['Signature'] as String?,
      ContentType: json['ContentType'] as String?,
      AcHolderName: json['AcHolderName'] as String?,
      AcNumber: json['AcNumber'] as String?,
      IfscCode: json['IfscCode'] as String?,
    );

Map<String, dynamic> _$DoctorDetailModelToJson(DoctorDetailModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('UserID', instance.UserID);
  writeNotNull('LiteAccount', instance.LiteAccount);
  writeNotNull('Name', instance.Name);
  writeNotNull('RegistrationNo', instance.RegistrationNo);
  writeNotNull('Qualifications', instance.Qualifications);
  writeNotNull('Address', instance.Address);
  writeNotNull('EmailID', instance.EmailID);
  writeNotNull('ContactNo', instance.ContactNo);
  writeNotNull('MeetingPwd', instance.MeetingPwd);
  writeNotNull('PresSrNo', instance.PresSrNo);
  writeNotNull('SessionId', instance.SessionId);
  writeNotNull('TotalTimeSecs', instance.TotalTimeSecs);
  writeNotNull('TotalTimeSecsLeft', instance.TotalTimeSecsLeft);
  writeNotNull('ConsultingFees', instance.ConsultingFees);
  writeNotNull('Signature', instance.Signature);
  writeNotNull('ContentType', instance.ContentType);
  writeNotNull('AcHolderName', instance.AcHolderName);
  writeNotNull('AcNumber', instance.AcNumber);
  writeNotNull('IfscCode', instance.IfscCode);
  return val;
}
