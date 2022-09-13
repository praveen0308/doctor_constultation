import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/material.dart';

import '../../../../network/utils/network_exceptions.dart';

part 'manage_plans_state.dart';

class ManagePlansCubit extends Cubit<ManagePlansState> {
  final AccountRepository _accountRepository;
  ManagePlansCubit(this._accountRepository) : super(ManagePlansInitial());


  void fetchSubscriptionPlans() async {
    emit(Loading());
    try {
      List<SubscriptionPlanModel> response = await _accountRepository.fetchAllSubscriptionPlans();
      emit(ReceivedPlans(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void deleteSubscriptionPlan(int subscriptionID) async {
    emit(Loading());
    try {
      bool response = await _accountRepository.deleteSubscriptionPlan(subscriptionID, false);
      if(response){
        emit(SuccessfullyDeleted());
      }else{
        emit(DeletionFailed());
      }

    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
