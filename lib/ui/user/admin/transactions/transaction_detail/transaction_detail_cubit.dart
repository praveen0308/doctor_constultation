import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/payment_transaction_model.dart';
import 'package:doctor_consultation/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../network/utils/network_exceptions.dart';

part 'transaction_detail_state.dart';

class TransactionDetailCubit extends Cubit<TransactionDetailState> {
  final _transactionRepository = TransactionRepository();
  TransactionDetailCubit() : super(TransactionDetailInitial());

  void fetchTransactionDetail(int transactionID) async {
    emit(Loading());
    try {
      PaymentTransactionModel response =
      await _transactionRepository.getPaymentTransactionByID(transactionID);
      emit(ReceivedTransactionDetail(response));

    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }


}
