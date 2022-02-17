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

Map<String, dynamic> _$DoctorDetailModelToJson(DoctorDetailModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'UserID': instance.UserID,
      'LiteAccount': instance.LiteAccount,
      'Name': instance.Name,
      'RegistrationNo': instance.RegistrationNo,
      'Qualifications': instance.Qualifications,
      'Address': instance.Address,
      'EmailID': instance.EmailID,
      'ContactNo': instance.ContactNo,
      'MeetingPwd': instance.MeetingPwd,
      'PresSrNo': instance.PresSrNo,
      'SessionId': instance.SessionId,
      'TotalTimeSecs': instance.TotalTimeSecs,
      'TotalTimeSecsLeft': instance.TotalTimeSecsLeft,
      'ConsultingFees': instance.ConsultingFees,
      'Signature': instance.Signature,
      'ContentType': instance.ContentType,
      'AcHolderName': instance.AcHolderName,
      'AcNumber': instance.AcNumber,
      'IfscCode': instance.IfscCode,
    };
