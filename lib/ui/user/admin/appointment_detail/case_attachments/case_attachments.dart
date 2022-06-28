import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_attachments/case_attachments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../res/app_colors.dart';
import '../../../../../res/style_text.dart';
import '../../../../widgets/loading_view.dart';

class CaseAttachments extends StatefulWidget {
  final int caseID;

  const CaseAttachments({Key? key, required this.caseID}) : super(key: key);

  @override
  State<CaseAttachments> createState() => _CaseAttachmentsState();
}

class _CaseAttachmentsState extends State<CaseAttachments> {
  late CaseAttachmentsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CaseAttachmentsCubit>(context);
    _cubit.getCaseAttachments(widget.caseID);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Attachments",
          style: AppTextStyle.subtitle1(),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 16,),
        BlocBuilder<CaseAttachmentsCubit, CaseAttachmentsState>(
            builder: (context, state) {
              if (state is LoadingCaseAttachments) {
                return const LoadingView(isVisible: true);
              }
              if (state is NoCaseAttachments) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 180),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryLightest,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Case attachments not found !!!",
                        style: AppTextStyle.subtitle1(),
                      ),
                    ),
                  ),
                );
              }
              if (state is ReceivedCaseAttachments) {
                return ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 180),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, childAspectRatio: 1),
                        itemCount: state.caseAttachments.length,
                        itemBuilder: (BuildContext context, int index) {
                          var caseAttachment = state.caseAttachments[index];
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.black26
                            ),
                            child: Image.network(caseAttachment.getDocUrl(),
                              errorBuilder: (context,exception,stackTrace) {
                                return const Icon(Icons.error,size: 45,color: Colors.black,);
                              },
                            ),
                          );
                        }));
              }
              return Container();
            }
        )
      ],
    );
  }
}
