part of 'transaction_history_cubit.dart';

@immutable
abstract class TransactionHistoryState {}

class TransactionHistoryInitial extends TransactionHistoryState {}
class LoadingTransactions extends TransactionHistoryState {}
class NoTransactions extends TransactionHistoryState {}
class Error extends TransactionHistoryState {
  final String msg;

  Error(this.msg);
}
class ReceivedTransactions extends TransactionHistoryState {
  final List<PaymentTransactionModel> transactions;
  ReceivedTransactions(this.transactions);
  List<PaymentTransactionModel> fetTransactions(){
    transactions.add(PaymentTransactionModel());
    return transactions;
  }
}
