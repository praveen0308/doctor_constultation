import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../network/utils/network_exceptions.dart';

part 'add_plan_state.dart';

class AddPlanCubit extends Cubit<AddPlanState> {
  final AccountRepository _accountRepository;
  AddPlanCubit(this._accountRepository) : super(AddPlanInitial());


  void addUpdateSubscriptionPlan(SubscriptionPlanModel planModel) async {
    emit(Loading());
    try {
      bool response = await _accountRepository.addUpdateSubscriptionPlan(planModel);
      emit(OperationSuccessful());
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
