import 'package:json_annotation/json_annotation.dart';

part 'doctor_payment_model.g.dart';

@JsonSerializable()
class DoctorPaymentModel {
  int? ID;
  int? DoctorInfoID;
  String? PaymentID;
  String? PaymentRequestID;
  int? Amount;
  int? TransactionFees;
  int? GST;
  String? PaymentStatus;
  int? PurchaseDate;
  int? PackageSeconds;
  int? PackageStatus;
  String? LongURL;
  String? PackageText;
  int? RepayAttempts;

  DoctorPaymentModel({this.ID, this.DoctorInfoID, this.PaymentID, this.PaymentRequestID, this.Amount, this.TransactionFees, this.GST, this.PaymentStatus, this.PurchaseDate, this.PackageSeconds, this.PackageStatus, this.LongURL, this.PackageText, this.RepayAttempts});

  factory DoctorPaymentModel.fromJson(Map<String, dynamic> json) => _$DoctorPaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorPaymentModelToJson(this);
}

