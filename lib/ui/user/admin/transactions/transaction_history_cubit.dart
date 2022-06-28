import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/payment_transaction_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'transaction_history_state.dart';

class TransactionHistoryCubit extends Cubit<TransactionHistoryState> {
  final TransactionRepository _transactionRepository;
  TransactionHistoryCubit(this._transactionRepository) : super(TransactionHistoryInitial());

  void fetchTransactionHistory() async {
    emit(LoadingTransactions());
    try {
      List<PaymentTransactionModel> response =
      await _transactionRepository.getPaymentTransactions();
      // response.add(PaymentTransactionModel(Name: "Praveen Yadav",AddedOn: "24th June 2022",PaymentAmount: 400.0,Status: "SUCCESS"));
      // response.add(PaymentTransactionModel(Name: "Praveen Yadav",AddedOn: "24th June 2022",PaymentAmount: 400.0,Status: "SUCCESS"));
      if(response.isNotEmpty) {
        emit(ReceivedTransactions(response));
      } else {
        emit(NoTransactions());
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
