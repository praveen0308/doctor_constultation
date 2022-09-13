import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/manage_plans/manage_plans_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import '../../../../res/app_colors.dart';

class ManagePlans extends StatefulWidget {
  const ManagePlans({Key? key}) : super(key: key);

  @override
  State<ManagePlans> createState() => _ManagePlansState();
}

class _ManagePlansState extends State<ManagePlans> {
  late ManagePlansCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<ManagePlansCubit>(context);
    _cubit.fetchSubscriptionPlans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Manage Plans"),
        ),
        body: BlocBuilder<ManagePlansCubit, ManagePlansState>(
          builder: (context, state) {
            if (state is Error) {
              return NoRecordsView(title: state.msg, onBtnClick: () {});
            }
            if(state is SuccessfullyDeleted){
              showToast("Deleted successfully !!!",ToastType.success);
              _cubit.fetchSubscriptionPlans();
            }
            if(state is DeletionFailed){
              showToast("Deletion failed !!!",ToastType.error);
              _cubit.fetchSubscriptionPlans();
            }
            if (state is ReceivedPlans) {
              return ListView.builder(
                itemBuilder: (_, index) {
                  var plan = state.plans[index];
                  return EditableSubscriptionPlanView(plan: plan, onDelete: () {
                    _cubit.deleteSubscriptionPlan(plan.SubscriptionID!);
                  }, onEdit: () async {
                    final result = await Navigator.pushNamed(context, route.addPlan,arguments: plan);

                    if(result==true){
                      _cubit.fetchSubscriptionPlans();
                    }
                  },);
                },
                itemCount: state.plans.length,
              );
            }

            return LoadingView(isVisible: state is Loading);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(context, route.addPlan,arguments: null);
          },
          label: const Text(
            "Add",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class EditableSubscriptionPlanView extends StatelessWidget {
  final SubscriptionPlanModel plan;
  final Function() onEdit;
  final Function() onDelete;

  const EditableSubscriptionPlanView({Key? key, required this.plan, required this.onEdit, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.greyLightest,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //  Header(Plan Name + Prices)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plan Name
            Expanded(
                child: Text(
              plan.PlanName.toString(),
              style: AppTextStyle.headline6(),
            )),

            // Current price above original price
            Column(
              children: [
                Text(
                  plan.getCurrentAmountWords(),
                  style: AppTextStyle.subtitle1(),
                ),
                Text(plan.getOriginalAmount(),
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey)),
              ],
            )
          ],
        ),
        //  Description (Title + text)

        Text(
          "Description",
          style: AppTextStyle.subtitle2(),
        ),
        Text(plan.PlanDescription.toString()),
        const SizedBox(height: 16,),
        const Divider(thickness: 1,),
        //  Discount Details (Duration + Discount)
        Text(
          "Discount Details",
          style: AppTextStyle.subtitle2(),
        ),
        Text("Duration : ${plan.getDuration()}"),
        Text("Discount : ${plan.getDiscount()}"),
        const SizedBox(height: 32,),
        //  Buttons (Delete + Edit)
        // BtnFilled(title: "Edit Discount", onBtnPressed: () {
        //   Navigator.pushNamed(context, route.addPlan,arguments: plan);
        // }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,


          children: [
            Expanded(child: BtnFilled(title: "Delete", onBtnPressed: onDelete)),
            const SizedBox(width: 16,),
            Expanded(child: BtnFilled(title: "Edit", onBtnPressed:onEdit)),
          ],
        )
      ]),
    );
  }
}
