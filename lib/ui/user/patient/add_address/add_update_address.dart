import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/add_address/add_update_address_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdateAddress extends StatefulWidget {
  const AddUpdateAddress({Key? key}) : super(key: key);

  @override
  _AddUpdateAddressState createState() => _AddUpdateAddressState();
}

class _AddUpdateAddressState extends State<AddUpdateAddress> {
  late AddUpdateAddressCubit _addUpdateAddressCubit;
  final AddressModel _addressModel = AddressModel();
  @override
  void initState() {
    super.initState();
    _addUpdateAddressCubit = BlocProvider.of<AddUpdateAddressCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Address"),
        ),
        body: BlocBuilder<AddUpdateAddressCubit, AddUpdateAddressState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }
            if (state is AddressAddedSuccessfully) {
              showToast("Added successfully !!!", ToastType.success);

              _addUpdateAddressCubit.close();
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pop(context);
              });
            }
            return Form(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScrollConfiguration(
                behavior: NoGlowBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /* Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Address Details",
                            style: AppTextStyle.headline5(),
                          )),*/
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _addressModel.LocationName = text,
                        onFieldSubmitted: (text) =>
                            _addressModel.LocationName = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter name',
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _addressModel.AddressLine1 = text,
                        onFieldSubmitted: (text) =>
                            _addressModel.AddressLine1 = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your address',
                          labelText: 'Address line 1',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _addressModel.AddressLine2 = text,
                        onFieldSubmitted: (text) =>
                            _addressModel.AddressLine2 = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your address',
                          labelText: 'Address line 2',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _addressModel.City = text,
                        onFieldSubmitted: (text) => _addressModel.City = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your city',
                          labelText: 'City',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _addressModel.State = text,
                        onFieldSubmitted: (text) => _addressModel.State = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your state',
                          labelText: 'State',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _addressModel.PinCode = text,
                        onFieldSubmitted: (text) =>
                            _addressModel.PinCode = text,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your pincode',
                          labelText: 'Pincode',
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      CustomBtn(
                          title: "Submit",
                          onBtnPressed: () {
                            _addUpdateAddressCubit.addNewAddress(_addressModel);
                          },
                          isLoading: state is Loading)
                    ],
                  ),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
