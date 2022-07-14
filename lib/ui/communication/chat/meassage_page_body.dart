import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation/models/fb_models/chat_response.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/communication/chat_screen/chat_screen.dart';
import 'package:doctor_consultation/ui/communication/patient_chat_row.dart';
import 'package:doctor_consultation/ui/widgets/patient/chat_with_patient.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import 'package:flutterfire_ui/firestore.dart';

import '../../../local/app_storage.dart';
import '../../widgets/patient/alpha_patient.dart';

class TemplateMessagePageBody extends StatefulWidget {
  TemplateMessagePageBody({Key? key}) : super(key: key);

  @override
  State<TemplateMessagePageBody> createState() => _TemplateMessagePageBodyState();
}

class _TemplateMessagePageBodyState extends State<TemplateMessagePageBody> {
  final _storage = SecureStorage();
  final usersQuery = FirebaseFirestore.instance
      .collection('Chats')
      .orderBy('lmAddedOn')
      .withConverter<ChatResponse>(
        fromFirestore: (snapshot, _) =>
            ChatResponse.fromJson(snapshot.id, snapshot.data()!),
        toFirestore: (resp, _) => resp.toJson(),
      );

  var userId = 0;
  @override
  void initState() {
    super.initState();
    _storage.getUserId().then((value) => userId = value);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewMyRichText(
          text1: "Patient's",
          text2: "Messages",
          txtStyle1: AppTextStyle.subtitle1(),
          txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          thickness: 1.5,
        ),
        FirestoreListView<ChatResponse>(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          query: usersQuery,
          itemBuilder: (context, snapshot) {
            // Data is now typed!
            ChatResponse resp = snapshot.data();
            return  GestureDetector(
              onTap: (){
                var isExpired = resp.expiry!.isBefore(DateTime.now());
                Navigator.of(context).pushNamed("/chatScreen",
                    arguments: ChatScreenArgs(userId.toString(),resp.userId!, resp.patientName!,
                        resp.chatId!, isExpired));
              },
              child: TemplateAlphaPatient(
                name: resp.patientName!,
                age: "${resp.age} Years",
                gender: resp.gender!,
                subtitle: resp.lastMessage ?? "",

              ),
            );
            /*return PatientChatRow(
                patientName: resp.patientName!,
                msg: resp.lastMessage ?? "",
                timeStamp: resp.lmAddedOn,
                onTap: () {
                  var isExpired = resp.expiry!.isBefore(DateTime.now());
                  Navigator.of(context).pushNamed("/chatScreen",
                      arguments: ChatScreenArgs(resp.userId!, resp.patientName!,
                          resp.chatId!, isExpired));
                });*/
          },
        )
        /*TemplateChatWithPatient(
          txtTitle: "Mr. Sunil Yadav",
          txtSubTitle: "Daily Checkup",
          txtAmt: "₹20",
          txtType: "Chat",
          cType: AppColors.successDark,
          bgType: AppColors.successLightest,
          txtIcon: AppImages.icMessage,
          onTab: () =>
              Navigator.pushNamed(context, route.layoutPaymentConfirmation),
        ),*/
      ],
    );
  }
}
