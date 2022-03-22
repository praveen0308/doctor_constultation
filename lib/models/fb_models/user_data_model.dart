import 'package:json_annotation/json_annotation.dart';
part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  int? userUId;
  int? userId;
  String? userName;
  String? email;
  String? mobileNo;
  String? addedOn;
  String? isActive;

  UserDataModel(
      {this.userUId,
      this.userId,
      this.userName,
      this.email,
      this.mobileNo,
      this.addedOn,
      this.isActive});

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
