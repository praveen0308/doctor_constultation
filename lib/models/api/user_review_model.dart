import 'package:json_annotation/json_annotation.dart';

part 'user_review_model.g.dart';

@JsonSerializable()
class UserReviewModel {
  int? ReviewID;
  int? UserID;
  int? Rating;
  String? Description;
  bool? IsApprove;
  int? AddedBy;
  int? AddedOn;
  int? ModifiedBy;
  int? ModifiedOn;
  bool? IsActive;

  UserReviewModel(
      {this.ReviewID,
      this.UserID,
      this.Rating,
      this.Description,
      this.IsApprove,
      this.AddedBy,
      this.AddedOn,
      this.ModifiedBy,
      this.ModifiedOn,
      this.IsActive});

  factory UserReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UserReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserReviewModelToJson(this);
}
