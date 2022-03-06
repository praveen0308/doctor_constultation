// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      VideoID: json['VideoID'] as int?,
      DoctorID: json['DoctorID'] as int?,
      Title: json['Title'] as String?,
      Description: json['Description'] as String?,
      VideoPath: json['VideoPath'] as String?,
      Thumbnail: json['Thumbnail'] as String?,
      VideoUrl: json['VideoUrl'] as String?,
      IsPaid: json['IsPaid'] as bool? ?? false,
      SubscriptionID: json['SubscriptionID'] as int?,
      AddedBy: json['AddedBy'] as int?,
      AddedOn: json['AddedOn'] as int?,
      UpdatedBy: json['UpdatedBy'] as int?,
      UpdatedOn: json['UpdatedOn'] as int?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'VideoID': instance.VideoID,
      'DoctorID': instance.DoctorID,
      'Title': instance.Title,
      'Description': instance.Description,
      'VideoPath': instance.VideoPath,
      'Thumbnail': instance.Thumbnail,
      'VideoUrl': instance.VideoUrl,
      'IsPaid': instance.IsPaid,
      'SubscriptionID': instance.SubscriptionID,
      'AddedBy': instance.AddedBy,
      'AddedOn': instance.AddedOn,
      'UpdatedBy': instance.UpdatedBy,
      'UpdatedOn': instance.UpdatedOn,
      'IsActive': instance.IsActive,
    };
