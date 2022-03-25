import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/material.dart';

class VideoView extends StatelessWidget {
  final VideoModel videoModel;
  final Function() onItemClick;
  final Function() onUpdateClick;
  final Function() onDeleteClick;
  const VideoView(
      {Key? key,
      required this.videoModel,
      required this.onItemClick,
      required this.onUpdateClick,
      required this.onDeleteClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                videoModel.Thumbnail,
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
            PopupMenuButton(
                onSelected: (index) {
                  if (index == 1) {
                    onUpdateClick();
                  } else {
                    onDeleteClick();
                  }
                },
                color: AppColors.greyLightest,
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.greyBefore,
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text("Update"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: const Text("Delete"),
                        value: 2,
                      ),
                    ])
          ],
        ),
      ),
    );
  }
}
