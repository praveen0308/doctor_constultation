import 'package:doctor_consultation/models/api/subscription_plan_model.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/manage_plans/add_plan/add_plan_cubit.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/btn/custom_btn.dart';

enum DiscountType { percentage, amount }
enum DiscountApplicability { no, yes }

class AddPlan extends StatefulWidget {
  final SubscriptionPlanModel? planModel;

  const AddPlan({Key? key, required this.planModel}) : super(key: key);

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  late AddPlanCubit _cubit;
  late SubscriptionPlanModel mPlanModel;
  final _addPlanFormKey = GlobalKey<FormState>();

  DiscountType? _discountType = DiscountType.percentage;
  DiscountApplicability? _discountApplicability = DiscountApplicability.no;


  //Text Controllers
  final _planNameController = TextEditingController();
  final _planDescriptionController = TextEditingController();
  final _amountTxtController = TextEditingController();
  final _discountTxtController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();

  @override
  void initState() {
    _cubit = BlocProvider.of<AddPlanCubit>(context);
    if(widget.planModel!=null){
      mPlanModel = widget.planModel!;
      _planNameController.text = mPlanModel.PlanName!;
      _planDescriptionController.text = mPlanModel.PlanDescription!;
      _amountTxtController.text = mPlanModel.Amount.toString();
      if(mPlanModel.Discount>0){
        _discountApplicability=DiscountApplicability.yes;

        _fromDateController.text = mPlanModel.getStartDate();
        _toDateController.text = mPlanModel.getEndDate();

        if(mPlanModel.IsFixed){
          _discountType = DiscountType.amount;
        }else{
          _discountType = DiscountType.percentage;
        }
        _discountTxtController.text = mPlanModel.Discount.toString();
      }

    }
    else{
      mPlanModel = SubscriptionPlanModel();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("New Subscription Plan"),
      ),
      body: Form(
        key: _addPlanFormKey,
        child: BlocBuilder<AddPlanCubit, AddPlanState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }
            if (state is OperationSuccessful) {
              showToast("Operation successful !!!", ToastType.success);
              _cubit.close();
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pop(context,true);
              });

            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextFormField(
                    onChanged: (text) {

                    },
                    onFieldSubmitted: (text) {

                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter name of plan',
                        labelText: 'Name',
                        counterText: ""),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    maxLength: 50,
                    controller: _planNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (text) {

                    },
                    onFieldSubmitted: (text) {},
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter description of plan',
                        labelText: 'Description',
                        counterText: ""),
                    controller: _planDescriptionController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    maxLength: 250,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (text) {},
                    onFieldSubmitted: (text) {},
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter original amount',
                        labelText: 'Amount',
                        counterText: "",
                        prefix: Icon(Icons.currency_rupee_rounded,size: 16,)),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 7,
                    controller: _amountTxtController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          double.parse(value) <= 0.0) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Discount Applicable??",
                    style: AppTextStyle.subtitle2(),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: ListTile(
                          title: const Text('No'),
                          leading: Radio<DiscountApplicability>(
                            value: DiscountApplicability.no,
                            groupValue: _discountApplicability,
                            onChanged: (DiscountApplicability? value) {
                              setState(() {
                                _discountApplicability = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: ListTile(
                          title: const Text('Yes'),
                          leading: Radio<DiscountApplicability>(
                            value: DiscountApplicability.yes,
                            groupValue: _discountApplicability,
                            onChanged: (DiscountApplicability? value) {
                              setState(() {
                                _discountApplicability = value;
                              });
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if(_discountApplicability!.index==1)Column(children: [
                    TextFormField(
                      controller: _fromDateController,
                      onChanged: (text) {},
                      onFieldSubmitted: (text) {},
                      onTap: () async {
                        DateTime? date = DateTime(2022);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          _fromDateController.text = date.toIso8601String();
                        }
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Start date',
                          labelText: 'From',
                          counterText: ""),
                      keyboardType: TextInputType.none,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _toDateController,
                      onChanged: (text) {},
                      onFieldSubmitted: (text) {},
                      onTap: () async {
                        DateTime? date = DateTime(2022);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          _toDateController.text = date.toIso8601String();
                        }
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'End date',
                          labelText: 'To',
                          counterText: ""),
                      keyboardType: TextInputType.none,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: ListTile(
                            title: const Text('Percentage'),
                            leading: Radio<DiscountType>(
                              value: DiscountType.percentage,
                              groupValue: _discountType,
                              onChanged: (DiscountType? value) {
                                setState(() {
                                  _discountType = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: ListTile(
                            title: const Text('Amount'),
                            leading: Radio<DiscountType>(
                              value: DiscountType.amount,
                              groupValue: _discountType,
                              onChanged: (DiscountType? value) {
                                setState(() {
                                  _discountType = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_discountType!.index == 0)
                      TextFormField(
                        onChanged: (text) {},
                        onFieldSubmitted: (text) {},
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter discount percentage',
                            labelText: 'Discount',
                            counterText: ""),
                        controller: _discountTxtController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        maxLength: 3,
                      ),
                    if (_discountType!.index == 1)
                      TextFormField(
                        onChanged: (text) {},
                        onFieldSubmitted: (text) {},
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter discount amount',
                            labelText: 'Discount',
                            counterText: ""),
                        controller: _discountTxtController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        maxLength: 7,
                      ),
                  ]),
                  const SizedBox(
                    height: 64,
                  ),
                  CustomBtn(
                      title: "Submit",
                      onBtnPressed: () {
                        if(_addPlanFormKey.currentState!.validate()){

                          mPlanModel.PlanName = _planNameController.text;
                          mPlanModel.PlanDescription = _planDescriptionController.text;
                          mPlanModel.Amount = double.parse(_amountTxtController.text);

                          if(_discountApplicability!.index == 0){
                            // if no
                            mPlanModel.IsFixed = false;
                            mPlanModel.Discount = 0.0;

                          }else{
                            mPlanModel.IsFixed = _discountType!.index == 1;
                            mPlanModel.Discount = double.parse(_discountTxtController.text);
                            mPlanModel.OfferStartDate = _fromDateController.text;
                            mPlanModel.OfferEndDate = _toDateController.text;
                          }



                          _cubit.addUpdateSubscriptionPlan(mPlanModel);
                        }
                      },
                      isLoading: state is Loading)
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
