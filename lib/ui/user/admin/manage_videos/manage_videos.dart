import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/user/admin/manage_videos/manage_videos_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/video_view_vr.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ManageVideos extends StatefulWidget {
  const ManageVideos({Key? key}) : super(key: key);

  @override
  State<ManageVideos> createState() => _ManageVideosState();
}

class _ManageVideosState extends State<ManageVideos> {
  late ManageVideosCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ManageVideosCubit>(context);
    _cubit.getAllVideos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Manage Videos"),
      ),
      body: Container(
        child: BlocBuilder<ManageVideosCubit, ManageVideosState>(
          builder: (context, state) {
            if (state is DeletedSuccessfully) {
              showToast("Deleted successfully !!!", ToastType.success);
            }
            if (state is Error) {
              return NoRecordsView(
                title: state.msg,
                onBtnClick: () {
                  _cubit.getAllVideos();
                },
                requiredBtn: true,
                btnText: "Retry",
              );
            }
            if (state is ReceivedVideos) {
              if (state.videos.isEmpty) {
                return NoRecordsView(title: "No videos!!!", onBtnClick: () {});
              } else {
                return ListView.separated(
                    separatorBuilder: (_, index) {
                      return Divider(
                        height: 1,
                      );
                    },
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: state.videos.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return VideoView(
                        videoModel: state.videos[index],
                        onItemClick: () {
                          String? videoId = YoutubePlayer.convertUrlToId(
                              state.videos[index].VideoUrl);
                          Navigator.pushNamed(context, "/youtubePlayer",
                              arguments: videoId);
                        },
                        onUpdateClick: () {
                          Navigator.pushNamed(context, "/uploadVideo",
                              arguments: state.videos[index]);
                        },
                        onDeleteClick: () {
                          _cubit.deleteVideo(state.videos[index].VideoID);
                        },
                      );
                    });
              }
            }
            return const LoadingView(isVisible: true);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.pushNamed(context, "/uploadVideo", arguments: VideoModel());
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
