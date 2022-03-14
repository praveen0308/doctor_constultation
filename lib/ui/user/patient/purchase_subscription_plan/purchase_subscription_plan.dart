import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
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

class PurchaseSubscriptionPlan extends StatefulWidget {
  const PurchaseSubscriptionPlan({Key? key}) : super(key: key);

  @override
  State<PurchaseSubscriptionPlan> createState() =>
      _PurchaseSubscriptionPlanState();
}

class _PurchaseSubscriptionPlanState extends State<PurchaseSubscriptionPlan> {
  late PurchaseSubscriptionPlanCubit _cubit;
  final List<SubscriptionPlanModel> plans = [];
  var amountPayable = 0.0;
  var subscriptionID = 0;
  late Razorpay _razorpay;

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    try {
      _razorpay = Razorpay();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    } catch (e) {
      debugPrint("Razorpay initialization failed!!!");
      debugPrint("Exception : $e");
    }

    _cubit = BlocProvider.of<PurchaseSubscriptionPlanCubit>(context);
    _cubit.getSubscriptionPlans();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Going to update user's subscription plan
    if (subscriptionID != 0) _cubit.upgradeUserSubscriptionPlan(subscriptionID);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showToast("Payment failed!!!", ToastType.error);
    // _placeOrder("Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  void _payUsingRazorpay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    var options = {
      'key': AppConstants.RAZORPAY_KEY_ID,
      'amount': 0 * 100,
      'name': 'Dr. Priyanka Yaduwanshi',
      'order_id': 'order_${AppConstants.getRandomString(14)}',
      'retry': {'enabled': true, 'max_count': 3},
      'description': 'Purchase Plan',
      'timeout': 60,
      'prefill': {'contact': '9699960540', 'email': 'yadavpravin1803@gmail.com'}
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
          }
          if (state is Error) {
            return NoRecordsView(
                title: state.msg,
                btnText: "Retry",
                onBtnClick: () {
                  _cubit.getSubscriptionPlans();
                });
          }
          return Stack(
            children: [
              // body
              Column(
                children: [
                  if (plans.isEmpty)
                    NoRecordsView(
                        title: "No subscription available !!!",
                        onBtnClick: () {}),
                  if (plans.isNotEmpty)
                    ListView.builder(
                        itemCount: plans.length,
                        itemBuilder: (_, index) {
                          var plan = plans[index];
                          return TemplateMembership(
                            txtTitle: plan.PlanName,
                            txtSubTitle: plan.PlanDescription,
                            selectionEnabled: true,
                            isSelected: plan.isSelected,
                            mIndex: index,
                            onSelected: (id) {
                              setState(() {
                                for (var element in plans) {
                                  element.isSelected = false;
                                }
                                plans[index].isSelected = true;
                                amountPayable = plans[index].Amount;
                                subscriptionID = plans[index].SubscriptionID!;
                              });
                            },
                          );
                        }),
                  if (state is Loading) const LoadingView(isVisible: true)
                ],
              ),

              // btn action
              CustomBtn(
                  title: "Continue",
                  onBtnPressed: () {
                    _payUsingRazorpay();
                  },
                  isLoading: state is UpdatingPlan)
            ],
          );
        },
      ),
    ));
  }
}
