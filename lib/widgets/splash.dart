import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/logo_vision.mp4');
  }

  void listener() {
    if (_controller!.value.position == _controller!.value.duration && mounted) {
      Navigator.pushReplacementNamed(context, 'home');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller!.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      _controller!.play();
      _controller!.addListener(listener);
    });
  }

  @override
  void dispose() {
    if (_controller!.value.isPlaying) _controller!.pause();
    _controller!.removeListener(listener);
    _controller = null;
    //_controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : Container()));
  }
}
