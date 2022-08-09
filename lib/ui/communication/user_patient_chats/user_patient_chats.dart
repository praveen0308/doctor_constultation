import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/fb_models/chat_response.dart';
import 'package:doctor_consultation/repository/chat_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/communication/chat/meassage_page_header.dart';
import 'package:doctor_consultation/ui/communication/chat_screen/chat_screen.dart';
import 'package:doctor_consultation/ui/communication/user_patient_chats/user_patient_chats_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/patient/alpha_patient.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPatientChats extends StatefulWidget {
  const UserPatientChats({Key? key}) : super(key: key);

  @override
  State<UserPatientChats> createState() => _UserPatientChatsState();
}

class _UserPatientChatsState extends State<UserPatientChats> {
  late UserPatientChatsCubit _cubit;
  final _storage = SecureStorage();
  var userId = 0;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<UserPatientChatsCubit>(context);
    _storage.getUserId().then((value) {


      setState(() {
        userId = value;
      });
      _cubit.getPatients(value);

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const TemplateMessagePageHeader(
              firstLine: "Let's Chat",
              secondLine: "With Doctor",
            ),
            const SizedBox(
              height: 16,
            ),
            ViewMyRichText(
              text1: "Patient's",
              text2: " Messages",
              txtStyle1: AppTextStyle.subtitle1(),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1.5,
            ),
            BlocBuilder<UserPatientChatsCubit, UserPatientChatsState>(
              builder: (context, state) {
                if (state is ReceivedPatientRecords) {
                  if (state.patients.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: state.patients.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            var patient = state.patients[index];
                            return GestureDetector(
                              onTap: () async {
                                /* check if patient id exists in firestore chats collection
                                * if exists get chatId & expiry
                                * else navigate to page chat not available book appointment to enable this
                                * according to subscription plan
                                * */
                                // var userId = await _storage.getUserId();
                                var chatResponse =
                                    await ChatRepository.getChatByPatientId(
                                        patient.ID.toString());

                                if (chatResponse != null) {
                                  var isExpired = chatResponse.expiry!
                                      .isBefore(DateTime.now());
                                  Navigator.of(context).pushNamed("/chatScreen",
                                      arguments: ChatScreenArgs(
                                          userId.toString(),
                                          patient.ID.toString(),
                                          AppConstants.doctorName,
                                          chatResponse.chatId!,
                                          isExpired));
                                } else {
                                  Navigator.pushNamed(
                                      context, "/chatNotAvailable");
                                }
                              },
                              child: TemplateAlphaPatient(
                                name: patient.FullName!,
                                age: "${patient.Age} Years",
                                gender: patient.getGender(),
                                subtitle: patient.MobileNo ?? "N.A.",
                                picUrl: patient.getProfileUrl(),
                              ),
                            );
                          }),
                    );
                  } else {
                    return const Center(
                      child: Text("No Patients Found!!!"),
                    );
                  }
                }

                return const LoadingView(isVisible: true);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
