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

class PurchaseSubscriptionPlanArgs {
  final ScheduleModel slotModel;
  final int patientId;
  final String description;

  PurchaseSubscriptionPlanArgs(
      {required this.slotModel,
      required this.patientId,
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
    _cubit.getSubscriptionPlanByLocation();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Going to update user's subscription plan
    showToast("Payment successful!!!", ToastType.success);
    if (subscriptionID != 0)
      _cubit.upgradeUserSubscriptionPlan(subscriptionID, widget.args.patientId);
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
      'amount': amountPayable * 100,
      'name': 'Dr. Priyanka Yaduwanshi',
      // 'order_id': 'order_${AppConstants.getRandomString(14)}',
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
            if (plans.isNotEmpty) {
              amountPayable = plans[0].Amount.toInt();
              subscriptionID = plans[0].SubscriptionID!;
            }
          }
          if (state is AddAppointmentFailed) {
            showToast("Failed booking appointment!!!", ToastType.error);
          }
          if (state is AppointmentAddedSuccessfully) {
            showToast("Appointment booked successfully!!!", ToastType.success);
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/successPage", (route) => route.isFirst,
                  arguments: SuccessPageArgs(
                      scheduleModel: widget.args.slotModel,
                      patientId: widget.args.patientId,
                      appointmentId: state.appointmentID));
            });
          }
          if (state is PlanUpdatedSuccessfully) {
            showToast("Plan updated successfully!!!", ToastType.success);
            _cubit.addNewAppointment(
                widget.args.patientId,
                widget.args.description,
                widget.args.slotModel.ScheduleID!,
                widget.args.slotModel.ScheduleDate!);
          }
          if (state is Error) {
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
                        physics: ClampingScrollPhysics(),
                        itemCount: plans.length,
                        itemBuilder: (_, index) {
                          var plan = plans[index];
                          return TemplateMembership(
                            txtTitle: plan.PlanName,
                            txtSubTitle: plan.PlanDescription,
                            selectionEnabled: true,
                            txtCaption: plan.Amount.toString(),
                            isSelected: plan.isSelected,
                            mIndex: index,
                            onSelected: (id) {
                              setState(() {
                                for (var element in plans) {
                                  element.isSelected = false;
                                }
                                plans[index].isSelected = true;
                                amountPayable = plans[index].Amount.toInt();
                                subscriptionID = plans[index].SubscriptionID!;
                              });
                            },
                          );
                        }),
                  if (state is Loading)
                    const Expanded(child: LoadingView(isVisible: true))
                ],
              ),

              // btn action
              Positioned(
                bottom: 0,
                left: 16,
                right: 16,
                child: CustomBtn(
                    title: "Continue",
                    onBtnPressed: () {
                      _payUsingRazorpay();
                    },
                    isLoading: state is UpdatingPlan),
              )
            ],
          );
        },
      ),
    ));
  }
}
