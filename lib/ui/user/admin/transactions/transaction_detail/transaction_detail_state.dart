part of 'transaction_detail_cubit.dart';

@immutable
abstract class TransactionDetailState {}

class TransactionDetailInitial extends TransactionDetailState {}
class Loading extends TransactionDetailState {}
class ReceivedTransactionDetail extends TransactionDetailState {
  final PaymentTransactionModel paymentTransaction;

  ReceivedTransactionDetail(this.paymentTransaction);

}
class Error extends TransactionDetailState {
  final String msg;

  Error(this.msg);

}


