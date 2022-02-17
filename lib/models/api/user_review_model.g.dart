// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReviewModel _$UserReviewModelFromJson(Map<String, dynamic> json) =>
    UserReviewModel(
      ReviewID: json['ReviewID'] as int?,
      UserID: json['UserID'] as int?,
      Rating: json['Rating'] as int?,
      Description: json['Description'] as String?,
      IsApprove: json['IsApprove'] as bool?,
      AddedBy: json['AddedBy'] as int?,
      AddedOn: json['AddedOn'] as int?,
      ModifiedBy: json['ModifiedBy'] as int?,
      ModifiedOn: json['ModifiedOn'] as int?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$UserReviewModelToJson(UserReviewModel instance) =>
    <String, dynamic>{
      'ReviewID': instance.ReviewID,
      'UserID': instance.UserID,
      'Rating': instance.Rating,
      'Description': instance.Description,
      'IsApprove': instance.IsApprove,
      'AddedBy': instance.AddedBy,
      'AddedOn': instance.AddedOn,
      'ModifiedBy': instance.ModifiedBy,
      'ModifiedOn': instance.ModifiedOn,
      'IsActive': instance.IsActive,
    };
