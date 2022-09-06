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

Map<String, dynamic> _$UserReviewModelToJson(UserReviewModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReviewID', instance.ReviewID);
  writeNotNull('UserID', instance.UserID);
  writeNotNull('Rating', instance.Rating);
  writeNotNull('Description', instance.Description);
  writeNotNull('IsApprove', instance.IsApprove);
  writeNotNull('AddedBy', instance.AddedBy);
  writeNotNull('AddedOn', instance.AddedOn);
  writeNotNull('ModifiedBy', instance.ModifiedBy);
  writeNotNull('ModifiedOn', instance.ModifiedOn);
  writeNotNull('IsActive', instance.IsActive);
  return val;
}
