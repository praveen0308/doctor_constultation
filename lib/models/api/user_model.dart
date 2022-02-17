import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? ID;
  String? UserName;
  String? MobileNo;
  String? EmailID;
  String? Password;
  int? UserRoleID;
  String? LangCulture;
  String? RegisteredOn;
  bool? IsActive;

  UserModel(
      {this.ID,
      this.UserName,
      this.MobileNo,
      this.EmailID,
      this.Password,
      this.UserRoleID,
      this.LangCulture,
      this.RegisteredOn,
      this.IsActive});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
