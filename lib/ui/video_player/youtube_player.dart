import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyYoutubePlayer extends StatefulWidget {
  final String videoId;
  const MyYoutubePlayer({Key? key, required this.videoId}) : super(key: key);

  @override
  State<MyYoutubePlayer> createState() => _MyYoutubePlayerState();
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer> {
  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
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
