import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvidpoint/videosList.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {   VideoPlayerScreen({required this.videoItem});   final VideoItem videoItem; 
  @override 
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(); 
}  
class _VideoPlayerScreenState extends State<VideoPlayerScreen> { 
  late YoutubePlayerController _controller;   late bool _isPlayerReady; 
 
  @override   void initState() {     super.initState(); 
    SystemChrome.setEnabledSystemUIOverlays([]); 
    SystemChrome.setPreferredOrientations([ 
      DeviceOrientation.landscapeRight, 
      DeviceOrientation.landscapeLeft 
    ]); 
    _isPlayerReady = false; 
    _controller = YoutubePlayerController( 
      initialVideoId: widget.videoItem.video.resourceId.videoId,       
      flags: YoutubePlayerFlags( 
                hideControls: false,         
                mute: false,         
                autoPlay: true, 
      ) 
    )..addListener(_listener); 
  } 
  void _listener(){ 
    if(_isPlayerReady && mounted && !_controller.value.isFullScreen){ 
      // 
    } 
  }   @override   void deactivate() {     _controller.pause();     super.deactivate(); 
  }   @override   void dispose() {     _controller.dispose();     super.dispose(); 
  } 
  @override 
  Widget build(BuildContext context) {     return WillPopScope(       onWillPop: (){ 
        
SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]); 
        SystemChrome.setPreferredOrientations([ 
          DeviceOrientation.portraitDown, 
          DeviceOrientation.portraitUp, 
        ]); 
        return Future<bool>.value(true); 
      },       child: Scaffold(         body: Container(           color: Colors.black87,           child: Center(             child: YoutubePlayer(               controller: _controller,               showVideoProgressIndicator: true,               onReady: (){ 
                _isPlayerReady = true; 
              }, 
            ), 
          ), 
        ), 
      ), 
    ); 
  } } 
 
