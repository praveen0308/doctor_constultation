import 'package:doctor_consultation/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyYoutubePlayer extends StatefulWidget {
  final String videoUrl;
  const MyYoutubePlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<MyYoutubePlayer> createState() => _MyYoutubePlayerState();
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer> {
  String videoId = "";
  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    /*  YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      videoProgressIndicatorColor: Colors.amber,
      progressColors: ProgressColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onReady () {
    _controller.addListener(listener);
    },
    ),*/
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);

          //we need to return a future
          return Future.value(false);
        },
        child: Scaffold(
          body: YoutubePlayerBuilder(
              onExitFullScreen: () {},
              player: YoutubePlayer(
                controller: _controller,
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    player,
                  ],
                );
              }),
        ),
      ),
    );
  }
}
