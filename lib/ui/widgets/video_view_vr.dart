import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';

class VideoView extends StatelessWidget {
  final VideoModel videoModel;
  final Function() onItemClick;
  final VoidCallback? onUpdateClick;
  final VoidCallback? onDeleteClick;
  final bool isActionEnabled;
  const VideoView(
      {Key? key,
      required this.videoModel,
      required this.onItemClick,
      this.onUpdateClick,
      this.onDeleteClick,
      this.isActionEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClick();
      },
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Image.network(
                AppConstants.getThumbnailUrl(videoModel.VideoUrl),
                errorBuilder: (context, exception, stackTrace) {
                  return FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryLight,
                      ),
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoModel.Title,
                  style: AppTextStyle.headline6(),
                ),
                Text(videoModel.Description)
              ],
            )),
            Visibility(
              visible: isActionEnabled,
              child: PopupMenuButton(
                  onSelected: (index) {
                    if (index == 1) {
                      onUpdateClick!();
                    } else {
                      onDeleteClick!();
                    }
                  },
                  color: AppColors.greyLightest,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.greyBefore,
                  ),
                  itemBuilder: (context) => const [
                        PopupMenuItem(
                          child: Text("Update"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Delete"),
                          value: 2,
                        ),
                      ]),
            )
          ],
        ),
      ),
    );
  }
}
