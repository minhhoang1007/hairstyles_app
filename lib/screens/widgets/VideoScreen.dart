import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  String video;
  VideoScreen({this.video, Key key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    createVideo();
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset(widget.video)
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Step by step",
            style: TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: Color.fromARGB(255, 255, 102, 204),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            child: playerController == null
                ? Container(
                    child: CircularProgressIndicator(),
                  )
                : VideoPlayer(playerController),
          ),
        ),
      ),
    );
  }
}
