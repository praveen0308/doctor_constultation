import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/ui/user/admin/upload_videos/upload_video_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {

  late UploadVideoCubit _cubit;
  final VideoModel _videoModel = VideoModel();
   @override
    void initState() {
      super.initState();
      _cubit = BlocProvider.of<UploadVideoCubit>(context);
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Upload Video"),
      ),
      body: BlocBuilder<UploadVideoCubit, UploadVideoState>(
        builder: (context, state) {
          if (state is Error) {
            showToast(state.msg, ToastType.error);
          }
          if (state is UploadedSuccessfully) {
            showToast("Uploaded successfully !!!", ToastType.success);

            _cubit.close();
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Form(
                child: ScrollConfiguration(
                  behavior: NoGlowBehaviour(),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.88,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            onChanged: (text) =>
                            _videoModel.Title = text,
                            onFieldSubmitted: (text) =>
                            _videoModel.Title = text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter video title',
                              labelText: 'Title',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            onChanged: (text) => _videoModel.Thumbnail = text,
                            onFieldSubmitted: (text) =>
                            _videoModel.Thumbnail = text,
                            minLines: 3,
                            maxLines: 12,

                            textAlignVertical:TextAlignVertical.top,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Paste thumbnail url...',
                              labelText: 'Thumbnail Url',
                              alignLabelWithHint: true,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            minLines: 3,
                            maxLines: 12,
                            textAlignVertical:TextAlignVertical.top,
                            onChanged: (text) => _videoModel.VideoUrl = text,
                            onFieldSubmitted: (text) =>
                            _videoModel.VideoUrl = text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Paste video url...',
                              alignLabelWithHint: true,
                              labelText: 'Video Url',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CheckboxListTile(
                            title: const Text("Is Paid?"),
                            value: _videoModel.IsPaid,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                            onChanged: (newValue) {
                              setState(() {
                                _videoModel.IsPaid = newValue!;
                              });

                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                          const Spacer(),
                          CustomBtn(
                              title: "Upload",
                              onBtnPressed: () {
                                _cubit.uploadVideoDetail(_videoModel);
                              },
                              isLoading: state is Uploading)
                        ],
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    ));
  }
}
