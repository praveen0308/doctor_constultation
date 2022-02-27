import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  int ID;
  int PatientID;
  String City;
  String State;
  String Country;
  String AddressLine1;
  String AddressLine2;
  int AddressType;
  int PinCode;
  int AddedBy;
  String AddedOn;
  bool IsActive;

  PatientAddressModel(
      {this.ID = 0,
      this.PatientID = 0,
      this.City = "",
      this.State = "",
      this.Country = "",
      this.AddressLine1 = "",
      this.AddressLine2 = "",
      this.AddressType = 0,
      this.PinCode = 0,
      this.AddedBy = 0,
      this.AddedOn = "",
      this.IsActive = true});

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);
}
