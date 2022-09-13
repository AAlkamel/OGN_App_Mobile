import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
class LiveScreen extends StatefulWidget {
  @override
  _LiveScreenState createState() => _LiveScreenState();
}
class _LiveScreenState extends State<LiveScreen> {
  late VlcPlayerController _videoPlayerController;
  Future<void> initializePlayer() async {}
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      'https://player.castr.com/live_fe729a00d35f11ec94610bd3484299e3',
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }
  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    // await _videoViewController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
