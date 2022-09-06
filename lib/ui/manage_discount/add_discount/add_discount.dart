import 'package:doctor_consultation/ui/manage_discount/add_discount/add_discount_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDiscount extends StatefulWidget {
  const AddDiscount({Key? key}) : super(key: key);

  @override
  State<AddDiscount> createState() => _AddDiscountState();
}

class _AddDiscountState extends State<AddDiscount> {

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  late AddDiscountCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AddDiscountCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Add Discount"),),
      body: Form(
        child: BlocBuilder<AddDiscountCubit, AddDiscountState>(
          builder: (context, state) {

            if(state is Error){
              showToast(state.msg,ToastType.error);
            }
            if(state is AddedSuccessfully){
              Navigator.pop(context);
              _cubit.emit(AddDiscountInitial());

            }
            return Column(
              children: [
                TextFormField(
                  onChanged: (text) {


                  },
                  onFieldSubmitted: (text) {

                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter name of discount',
                      labelText: 'Name',
                      counterText: ""),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLength: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: fromDateController,
                  onChanged: (text) {


                  },
                  onFieldSubmitted: (text) {

                  },
                  onTap: () async {
                    DateTime? date = DateTime(2022);
                    FocusScope.of(context).requestFocus(FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      fromDateController.text = date.toIso8601String();
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
                const SizedBox(height: 16,),
                TextFormField(
                  controller: toDateController,
                  onChanged: (text) {


                  },
                  onFieldSubmitted: (text) {

                  },
                  onTap: () async {
                    DateTime? date = DateTime(2022);
                    FocusScope.of(context).requestFocus(FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      toDateController.text = date.toIso8601String();
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
                const SizedBox(height: 16,),
                TextFormField(
                  onChanged: (text) {


                  },
                  onFieldSubmitted: (text) {

                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter discount percentage',
                      labelText: 'Discount',
                      counterText: ""),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 3,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                CustomBtn(title: "Submit",
                    onBtnPressed: () {},
                    isLoading: state is Loading)
              ],
            );
          },
        ),
      ),
    ));
  }
}
