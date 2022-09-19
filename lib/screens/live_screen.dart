import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/general/app_bar.dart';
import '../widgets/general/app_drawer.dart';
class LiveScreen extends StatefulWidget {
  static const screenRoute = '/live';
  @override
  _LiveScreenState createState() => _LiveScreenState();
}
class _LiveScreenState extends State<LiveScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:  MyAppBar('Live'),
        drawer: AppDrawer(),
        body: Container(
          padding: EdgeInsets.only(top: 100),
          child: WebView(

            initialUrl: Uri.dataFromString(
                '<html><body><iframe src="https://player.castr.com/live_fe729a00d35f11ec94610bd3484299e3" height="550" width="100%" style="aspect-ratio: 16/9; min-height: 340px;" frameborder="0" scrolling="no" allow="autoplay" allowfullscreen  webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe></body></html>'
                //'<html><body><iframe height="550"  width="100%" src="https://www.youtube.com/embed/FrqGGw9DYfs"></iframe></body></html>'
                , mimeType: 'text/html').toString(),
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
