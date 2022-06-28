import 'package:doctor_consultation/models/api/payment_transaction_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/transactions/transaction_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {

  late TransactionHistoryCubit _cubit;


  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<TransactionHistoryCubit>(context);
    _cubit.fetchTransactionHistory();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: BlocBuilder<TransactionHistoryCubit,TransactionHistoryState>(builder: (context,state){
        if(state is Error){
          return Center(
            child: Text(state.msg),
          );
        }
        if(state is NoTransactions){
          return const Center(
            child: Text("No Transactions !!!"),
          );
        }

        if(state is ReceivedTransactions){
          return ListView.separated(separatorBuilder: (context, index) => const SizedBox(height: 10,),itemCount: state.transactions.length,itemBuilder: (context, index) => TransactionView(transactionModel: state.transactions[index]));
        }
        return const LoadingView(isVisible: true);
      }),
    ));
  }
}

class TransactionView extends StatelessWidget {
  final PaymentTransactionModel transactionModel;
  const TransactionView({Key? key, required this.transactionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryLight
          ),
          child: Icon(Icons.call_received_rounded,size: 32,color: AppColors.primary,),

        ),

        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          Text(transactionModel.Name ?? "N.A.",style: AppTextStyle.headline6(),),
          const SizedBox(height: 8,),
          Text(transactionModel.AddedOn ?? "N.A.",style: TextStyle(color: AppColors.greyDark),)
        ],)),
        Column(crossAxisAlignment: CrossAxisAlignment.end,children: [
          Text("₹${transactionModel.PaymentAmount}",style:AppTextStyle.subtitle1(txtColor: Colors.green,),),
          const SizedBox(height: 8,),
          Text(transactionModel.Status!,style: AppTextStyle.captionRF2(),)],)
      ],),
    );
  }
}

