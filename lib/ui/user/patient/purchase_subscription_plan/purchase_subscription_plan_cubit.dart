import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'purchase_subscription_plan_state.dart';

class PurchaseSubscriptionPlanCubit
    extends Cubit<PurchaseSubscriptionPlanState> {
  final AccountRepository _accountRepository;
  final TransactionRepository _transactionRepository;
  PurchaseSubscriptionPlanCubit(
      this._accountRepository, this._transactionRepository)
      : super(PurchaseSubscriptionPlanInitial());

  void getSubscriptionPlans() async {
    emit(Loading());
    try {
      List<SubscriptionPlanModel> response =
          await _accountRepository.fetchAllSubscriptionPlans();

      emit(ReceivedSubscriptionPlans(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void upgradeUserSubscriptionPlan(int subscriptionId) async {
    emit(Loading());
    try {
      bool response = await _transactionRepository
          .updateUserSubscriptionDetail(subscriptionId);
      emit(OnUpdated(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
