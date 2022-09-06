 import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/ui/common/success_view.dart';
import 'package:doctor_consultation/ui/user/patient/purchase_subscription_plan/purchase_subscription_plan_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/membership.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../res/app_string.dart';
import '../../../../util/razorpay_helper.dart';

class PurchaseSubscriptionPlanArgs {
  final ScheduleModel slotModel;
  final PatientDetailModel patientDetailModel;
  final String description;

  PurchaseSubscriptionPlanArgs(
      {required this.slotModel,
      required this.patientDetailModel,

      required this.description});
}

class PurchaseSubscriptionPlan extends StatefulWidget {
  final PurchaseSubscriptionPlanArgs args;

  const PurchaseSubscriptionPlan({Key? key, required this.args})
      : super(key: key);

  @override
  State<PurchaseSubscriptionPlan> createState() =>
      _PurchaseSubscriptionPlanState();
}

class _PurchaseSubscriptionPlanState extends State<PurchaseSubscriptionPlan> {
  late PurchaseSubscriptionPlanCubit _cubit;
  final List<SubscriptionPlanModel> plans = [];
  var amountPayable = 0;
  var subscriptionID = 0;
  late Razorpay _razorpay;
  var appointmentId = 0;

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {

    super.initState();
    debugPrint("patient Id : ${widget.args.patientDetailModel.ID}");
    debugPrint("patient name : ${widget.args.patientDetailModel.FullName}");
    try {
      _razorpay = Razorpay();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    } catch (e) {
      showToast("Unable to open payment gateway !!!", ToastType.error);
      debugPrint("Razorpay initialization failed!!!");
      debugPrint("Exception : $e");
    }

    _cubit = BlocProvider.of<PurchaseSubscriptionPlanCubit>(context);
    _cubit.getSubscriptionPlans();

  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Going to update user's subscription plan
    showToast("Payment successful!!!", ToastType.success);
    if (subscriptionID != 0) {
      _cubit.addPaymentTransaction(response.paymentId.toString(),response.orderId.toString(),amountPayable.toDouble(), appointmentId,widget.args.patientDetailModel.ID!);

    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showToast("Payment failed!!!", ToastType.error);
    // _placeOrder("Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  Future<void> _payUsingRazorpay() async {
    String orderId = await generateOrderId(AppConstants.RAZORPAY_KEY_ID,AppConstants.RAZORPAY_KEY_SECRET,amountPayable * 100);
    var options = {
      'key': AppConstants.RAZORPAY_KEY_ID,
      'amount': amountPayable * 100,
      'name': AppConstants.doctorName,
      'order_id': orderId,
      'retry': {'enabled': true, 'max_count': 3},
      'description': 'Purchase Plan',
      'timeout': 180,
      'prefill': {'contact': AppStrings.drContactNo, 'email': AppStrings.drEmail}
    };

    _razorpay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Plan"),
      ),
      body: BlocBuilder<PurchaseSubscriptionPlanCubit,
          PurchaseSubscriptionPlanState>(
        builder: (context, state) {
          if (state is ReceivedSubscriptionPlans) {
            plans.clear();
            plans.addAll(state.plans);
            if (plans.isNotEmpty) {
              amountPayable = plans[0].Amount.toInt();
              subscriptionID = plans[0].SubscriptionID!;
            }
          }
          // if(state is Processing){
          //   showLoaderDialog(context, state.msg);
          // }
          if (state is AddAppointmentFailed) {
            // Navigator.pop(context);
            showToast("Failed booking appointment!!!", ToastType.error);
          }
          if (state is AppointmentAddedSuccessfully) {
            // Navigator.pop(context);
            showToast("Appointment booked successfully!!!", ToastType.success);
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/successPage", (route) => route.isFirst,
                  arguments: SuccessPageArgs(
                      scheduleModel: widget.args.slotModel,
                      patientId: widget.args.patientDetailModel.ID!,
                      appointmentId: state.appointmentID));
            });
          }
          if(state is TransactionAddedSuccessfully){
            _cubit.upgradeUserSubscriptionPlan(subscriptionID, widget.args.patientDetailModel.ID!);
          }
          if (state is PlanUpdatedSuccessfully) {
            // showToast("Plan updated successfully!!!", ToastType.success);
            _cubit.addNewAppointment(
                widget.args.patientDetailModel,
                widget.args.description,
                widget.args.slotModel.ScheduleID!,
                widget.args.slotModel.ScheduleDate!);
          }
          if (state is Error) {
            // Navigator.pop(context);
            showToast(state.msg, ToastType.error);
            /*return Expanded(
              child: NoRecordsView(
                  title: state.msg,
                  btnText: "Retry",
                  onBtnClick: () {
                    _cubit.getSubscriptionPlans();
                  }),
            );*/
          }
          return Stack(
            children: [
              // body
              Column(
                children: [
                  if (plans.isEmpty)
                    Expanded(
                      child: NoRecordsView(
                          title: "No subscription available !!!",
                          onBtnClick: () {}),
                    ),
                  if (plans.isNotEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: plans.length,
                        itemBuilder: (_, index) {
                          var plan = plans[index];

                          if(plan.Discount > 0.0){
                            return TemplateMembership(
                              txtTitle: plan.PlanName,
                              txtSubTitle: plan.PlanDescription,
                              selectionEnabled: true,
                              txtCaption: plan.getCurrentAmountWords(),
                              txtCaption1: plan.getOriginalAmount(),
                              validity: "Valid till ${plan.getDuration()}",
                              isSelected: plan.isSelected,
                              mIndex: index,
                              onSelected: (id) {
                                setState(() {
                                  for (var element in plans) {
                                    element.isSelected = false;
                                  }
                                  plans[index].isSelected = true;

                                });
                              },
                            );
                          }else{
                            return TemplateMembership(
                              txtTitle: plan.PlanName,
                              txtSubTitle: plan.PlanDescription,
                              selectionEnabled: true,
                              txtCaption: plan.getCurrentAmountWords(),
                              isSelected: plan.isSelected,
                              mIndex: index,
                              onSelected: (id) {
                                setState(() {
                                  for (var element in plans) {
                                    element.isSelected = false;
                                  }
                                  plans[index].isSelected = true;
                                });
                              },
                            );
                          }

                        }),
                  if (state is Loading)
                    const Expanded(child: LoadingView(isVisible: true))
                ],
              ),

              // btn action
              Positioned(
                bottom: 10,
                left: 16,
                right: 16,
                child: CustomBtn(
                    title: "Continue",
                    onBtnPressed: () async{
                      amountPayable = plans.firstWhere((element) => element.isSelected==true).getCurrentAmount().toInt();
                      subscriptionID = plans.firstWhere((element) => element.isSelected==true).SubscriptionID!;
                      print("Payable AMount : $amountPayable");
                      await _payUsingRazorpay();
                    },
                    isLoading: state is Processing),
              )
            ],
          );
        },
      ),
    ));
  }

  /*showLoaderDialog(BuildContext context,String msg){
    AlertDialog alert=AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(msg),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }*/
}
