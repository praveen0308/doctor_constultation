import 'package:json_annotation/json_annotation.dart';

part 'vc_payment_history_model.g.dart';

@JsonSerializable()
class VcPaymentHistoryModel {
  int? ID;
  int? VideoCallID;
  String? PaymentID;
  String? PaymentRequestID;
  int? Amount;
  String? PaymentStatus;
  String? LongURL;
  int? SettlementDate;
  bool? IsSettlementCreated;
  String? SettlementStatus;
  int? TransactionFees;
  int? GST;

  VcPaymentHistoryModel({this.ID, this.VideoCallID, this.PaymentID, this.PaymentRequestID, this.Amount, this.PaymentStatus, this.LongURL, this.SettlementDate, this.IsSettlementCreated, this.SettlementStatus, this.TransactionFees, this.GST});

  factory VcPaymentHistoryModel.fromJson(Map<String, dynamic> json) => _$VcPaymentHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$VcPaymentHistoryModelToJson(this);
}

