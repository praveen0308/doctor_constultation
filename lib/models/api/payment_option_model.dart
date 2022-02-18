import 'package:json_annotation/json_annotation.dart';

part 'payment_option_model.g.dart';

@JsonSerializable()
class PaymentOptionModel {
  int? ID;
  String? PaymentText;
  int? Amount;
  int? PackageTime;

  PaymentOptionModel({this.ID, this.PaymentText, this.Amount, this.PackageTime});

  factory PaymentOptionModel.fromJson(Map<String, dynamic> json) => _$PaymentOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionModelToJson(this);
}

