import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  int ID;
  int UserID;
  String City;
  String LocationName;
  String State;
  String Country;
  String AddressLine1;
  String AddressLine2;
  int AddressType;
  String PinCode;
  int AddedBy;
  String? AddedOn;
  bool IsActive;

  AddressModel(
      {this.ID = 0,
      this.UserID = 0,
      this.City = "",
      this.LocationName = "",
      this.State = "",
      this.Country = "",
      this.AddressLine1 = "",
      this.AddressLine2 = "",
      this.AddressType = 0,
      this.PinCode = "",
      this.AddedBy = 0,
      this.AddedOn,
      this.IsActive = true});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  String getPreparedAddress() => "$AddressLine1,$AddressLine2,";
}
