import 'package:doctor_consultation/ui/user/admin/transactions/transaction_detail/transaction_detail_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../res/app_colors.dart';
import '../../../../../res/style_text.dart';

class TransactionDetail extends StatefulWidget {
  final int transactionID;

  const TransactionDetail({Key? key, required this.transactionID})
      : super(key: key);

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  late TransactionDetailCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<TransactionDetailCubit>(context);
    _cubit.fetchTransactionDetail(widget.transactionID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Transaction Detail"),
      ),
      body: BlocBuilder<TransactionDetailCubit, TransactionDetailState>(
        builder: (context, state) {
          if (state is Error) {
            return NoRecordsView(title: state.msg, onBtnClick: () {});
          }

          if (state is ReceivedTransactionDetail) {
            final transaction = state.paymentTransaction;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  _DetailRow(mLabel: "Payment ID", mText: transaction.PaymentID.toString()),
                  _DetailRow(mLabel: "User Name", mText: transaction.UserName.toString()),
                  _DetailRow(mLabel: "Patient Name", mText: transaction.PatientName.toString()),
                  _DetailRow(mLabel: "Amount", mText: "₹${transaction.PaymentAmount}"),
                  _DetailRow(mLabel: "Appointment Number", mText: transaction.AppointmentNumber.toString()),
                  _DetailRow(mLabel: "Message", mText: transaction.Message.toString()),
                  _DetailRow(mLabel: "Payment Date", mText: transaction.getPaymentDate()),

                ],
              ),
            );
          }

          return const LoadingView(isVisible: true);
        },
      ),
    ));
  }
}

class _DetailRow extends StatelessWidget {
  final String mLabel;
  final String mText;

  const _DetailRow({Key? key, required this.mLabel, required this.mText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      child: Row(

        children: [
          Text(
            mLabel,
            style: AppTextStyle.body1(
                txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            mText,
            style: AppTextStyle.subtitle1(
                txtColor: AppColors.greyDark, wFont: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
