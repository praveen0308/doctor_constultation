import 'package:doctor_consultation/ui/user/admin/search_user/search_user_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/patient/alpha_patient.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({Key? key}) : super(key: key);

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  late SearchUserCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<SearchUserCubit>(context);
    _cubit.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Manage Users"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ViewSearchPatientFilter(
                onTextUpdated: (txt) {
                  _cubit.filterUser(txt);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchUserCubit, SearchUserState>(
                builder: (context, state) {
                  if (state is Error) {
                    showToast(state.msg, ToastType.error);
                  }
                  if (state is ReceivedUsers) {
                    if (state.users.isEmpty) {
                      return NoRecordsView(
                          title: "No users found!!!", onBtnClick: () {});
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: state.users.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            var user = state.users[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/userDetails",
                                    arguments: user.ID);
                              },
                              child: TemplateAlphaPatient(
                                name: user.UserName!,
                                age: "${user.Age} Years",
                                gender: user.Gender,
                                subtitle: user.MobileNo!, picUrl: user.getProfileUrl(),
                              ),
                            );
                          });
                    }
                  }
                  return LoadingView(isVisible: state is Loading);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
