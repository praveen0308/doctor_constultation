import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_transaction_model.g.dart';

@JsonSerializable()
class PaymentTransactionModel {
  int? ID;
  String? PaymentID;
  String? OrderID;
  int? CaseID;
  int? PatientID;
  String? PatientName;
  int? UserID;
  String? UserName;
  String? Name;
  double? PaymentAmount;
  String? Status;
  String? Message;
  String? AppointmentNumber;
  bool? IsRefunded;
  String? RefundReason;
  String? AddedOn;
  double? RefundAmount;
  bool? IsPaid;
  bool? IsCancel;
  String? PaymentDate;


  PaymentTransactionModel({this.ID, this.PaymentID, this.OrderID, this.CaseID, this.PatientID,this.PatientName, this.Name, this.UserID, this.UserName,this.PaymentAmount, this.Status, this.Message, this.IsRefunded, this.RefundReason, this.AddedOn, this.RefundAmount, this.IsPaid, this.IsCancel,this.PaymentDate,this.AppointmentNumber});

  factory PaymentTransactionModel.fromJson(Map<String, dynamic> json) => _$PaymentTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTransactionModelToJson(this);

  String getTransactionDate() => DateFormat("dd MMM yy, hh:mm a")
      .format(DateFormat("yyyy-MM-dd'T'hh:mm:ss").parse(AddedOn!));
  String getPaymentDate() => DateFormat("dd MMM yy, hh:mm a")
      .format(DateFormat("yyyy-MM-dd'T'hh:mm:ss").parse(PaymentDate!));
}

