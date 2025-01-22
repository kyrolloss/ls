import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  final String id;

  VideoWidget({super.key, required this.id});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          color: Colors.black,
          child: VimeoPlayer(
            /////
            videoId: widget.id,

            // 987689729
          ),
        ));
  }
}
