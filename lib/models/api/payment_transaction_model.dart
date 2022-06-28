import 'package:json_annotation/json_annotation.dart';

part 'payment_transaction_model.g.dart';

@JsonSerializable()
class PaymentTransactionModel {
  int? ID;
  String? PaymentID;
  String? OrderID;
  int? CaseID;
  int? PatientID;
  String? Name;
  int? UserID;
  double? PaymentAmount;
  String? Status;
  String? Message;
  bool? IsRefunded;
  String? RefundReason;
  String? AddedOn;
  double? RefundAmount;
  bool? IsPaid;
  bool? IsCancel;

  PaymentTransactionModel({this.ID, this.PaymentID, this.OrderID, this.CaseID, this.PatientID, this.Name, this.UserID, this.PaymentAmount, this.Status, this.Message, this.IsRefunded, this.RefundReason, this.AddedOn, this.RefundAmount, this.IsPaid, this.IsCancel});

  factory PaymentTransactionModel.fromJson(Map<String, dynamic> json) => _$PaymentTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTransactionModelToJson(this);
}

