import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_plan_model.g.dart';

@JsonSerializable()
class SubscriptionPlanModel {
  int? SubscriptionID;
  String? PlanName;
  String? PlanDescription;
  int? PlanType;
  String? CurrencyType;
  double Amount;
  String? Country;
  bool? IsActive;
  double Discount;
  String? OfferStartDate;
  String? OfferEndDate;
  bool IsFixed;
  @JsonKey(ignore: true)
  bool isSelected = false;

  SubscriptionPlanModel({
    this.SubscriptionID,
    this.PlanName,
    this.PlanDescription,
    this.PlanType,
    this.CurrencyType,
    this.Amount = 0.0,
    this.Discount = 0.0,
    this.OfferStartDate,
    this.OfferEndDate,
    this.Country,
    this.IsActive,
    this.IsFixed = true,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPlanModelToJson(this);

  double getCurrentAmount() {
    if (Discount == 0) {
      return Amount;
    } else {
      if (IsFixed) {
        return Amount - Discount;
      } else {
        var discountAmt = (Discount / 100) * Amount;
        return Amount - discountAmt;
      }
    }
  }

  String getCurrentAmountWords() => "₹${getCurrentAmount()}";

  String getOriginalAmount() => "₹$Amount";

  String getDiscount() {
    if (IsFixed) {
      return "₹$Discount";
    } else {
      return "$Discount %";
    }
  }

  String getStartDate() {
    if (OfferStartDate != null) {
      return DateFormat("dd MMM yy")
          .format(DateFormat("yyyy-MM-dd'T'hh:mm:ss").parse(OfferStartDate!));
    }

    return "";
  }

  String getEndDate() {
    if (OfferEndDate != null) {
      return DateFormat("dd MMM yy")
          .format(DateFormat("yyyy-MM-dd'T'hh:mm:ss").parse(OfferEndDate!));
    }

    return "";
  }

  String getDuration() {
    if (OfferStartDate != null && OfferEndDate != null) {
      return "${getStartDate()} to ${getEndDate()}";
    }
    return "N.A.";
  }
}
