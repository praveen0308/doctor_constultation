import 'package:doctor_consultation/ui/user/admin/manage_users/manage_users_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/patient_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({Key? key}) : super(key: key);

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  late ManageUsersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ManageUsersCubit>(context);
    _cubit.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Manage Users"),
      ),
      body: Column(
        children: [
          ViewSearchPatientFilter(
            onTextUpdated: (String text) {},
          ),
          Expanded(
            child: BlocBuilder<ManageUsersCubit, ManageUsersState>(
              builder: (context, state) {
                if (state is Error) {
                  return NoRecordsView(
                    title: state.msg,
                    onBtnClick: () {
                      _cubit.getAllUsers();
                    },
                    requiredBtn: true,
                    btnText: "Retry",
                  );
                }
                if (state is ReceivedUsers) {
                  if (state.users.isEmpty) {
                    return NoRecordsView(
                        title: "No users!!!", onBtnClick: () {});
                  } else {
                    return ListView.separated(
                        separatorBuilder: (_, index) {
                          return Divider(
                            height: 1,
                          );
                        },
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: state.users.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          var user = state.users[index];
                          return PatientRow(
                              name: user.UserName!, onRowClick: () {});
                        });
                  }
                }
                return const LoadingView(isVisible: true);
              },
            ),
          ),
        ],
      ),
    ));
  }
}
