import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/user/patient/profile/my_addresses/user_addresses_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/view_address_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAddresses extends StatefulWidget {
  const UserAddresses({Key? key}) : super(key: key);

  @override
  State<UserAddresses> createState() => _UserAddressesState();
}

class _UserAddressesState extends State<UserAddresses> {
  late UserAddressesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<UserAddressesCubit>(context);
    _cubit.fetchAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Addresses"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BlocBuilder<UserAddressesCubit, UserAddressesState>(
                builder: (context, state) {
                  if (state is Error) {
                    return Center(
                      child: Text(state.msg),
                    );
                  }
                  if (state is NoAddresses) {
                    return const Center(
                      child: Text("No addresses !!!"),
                    );
                  }
                  if (state is ReceivedAddressList) {
                    return ListView.builder(
                        itemCount: state.addressList.length,
                        itemBuilder: (_, index) {
                          return ViewAddressDetail(
                            txtTitle: state.addressList[index].LocationName,
                            txtSubTitle: state.addressList[index].AddressLine1,
                          );
                        });
                  }
                  return const LoadingView(isVisible: true);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomBtn(
                  title: "Add new address",
                  onBtnPressed: () {
                    Navigator.pushNamed(context, "/addUpdateAddress");
                  },
                  isLoading: false),
            )
          ],
        ),
      ),
    );
  }
}
