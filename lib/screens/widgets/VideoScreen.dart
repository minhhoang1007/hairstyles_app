import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  String video;
  VideoScreen({this.video, Key key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController playerController;
  ChewieController _chewieController;
  VoidCallback listener;

  @override
  void initState() {
    createVideo();
    super.initState();
    listener = () {
      setState(() {});
    };
    _chewieController = ChewieController(
      videoPlayerController: playerController,
      aspectRatio: 1,
      // autoPlay: true,
      // looping: true,
    );
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
  void dispose() {
    playerController.dispose();
    _chewieController.dispose();
    super.dispose();
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
        // backgroundColor: Color.fromARGB(255, 200, 102, 204),
        backgroundColor: Color.fromARGB(255, 127, 228, 125),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
          //         child: AspectRatio(
          //   aspectRatio: 16 / 9,
          //   child: Container(
          //     child: playerController == null
          //         ? Container(
          //             child: CircularProgressIndicator(),
          //           )
          //         : VideoPlayer(playerController),
          //   ),
          // ),
        ),
      ),
    );
  }
}
