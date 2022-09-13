import 'package:flutter/material.dart';
import 'package:ogn_app/widgets/general/app_bar.dart';
import 'package:video_player/video_player.dart';

import '../constant.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  String dataSrc =
      // 'https://player.castr.com/live_fe729a00d35f11ec94610bd3484299e3'
  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
  ;
  VideoPlayerController? _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(dataSrc)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('OGN Live'),
      // appBar: AppBar(
      //   elevation: 2,
      //   centerTitle: true,
      //   backgroundColor: darkColor,
      //   title: const Text('OGN Live'),
      // ),
      backgroundColor: Colors.grey[700],
      body: Column(
        children: [
          _controller!.value.isInitialized
              ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
              )
              : Container(
                  height: 370,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous)),
              IconButton(
                  onPressed: () {_controller!.value.isPlaying?_controller!.pause():_controller!.play();}, icon: Icon(Icons.play_arrow_rounded)),
              IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
            ],
          )
        ],
      ),
    );
  }
}

//
// class LiveScreen extends StatefulWidget {
//   const LiveScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LiveScreen> createState() => _LiveScreenState();
// }
//
// class _LiveScreenState extends State<LiveScreen> {
//   late Future<Live?> live;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child:FutureBuilder<Live?>(
//       future: live =getLivePage(),
//       builder: (context,snapshot){
//         if(snapshot.hasData) {
//           String s = (getVideo(snapshot.data!.content));
//
//           return  Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 10, vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         child: Text(
//                           unescape.convert(
//                             snapshot.data!.title,
//                           ),
//                           style: TextStyle(
//                             color: Colors.grey[800],
//                             fontWeight: FontWeight.bold,
//                             fontSize: fontSize * .9,
//                             height: 1.3,
//                             letterSpacing: .15,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 75,
//                         height: 2,
//                         child: Divider(
//                           color: Colors.grey,
//                         ),
//                       ),
//
//                       Visibility(
//                         visible: (s!= "-"),
//                         child: const Center(),
//                         // child: YoutubePlayer(controller: YoutubePlayerController(initialVideoId: convertedUrl(getVideo(snapshot.data!.content)),flags: const YoutubePlayerFlags(autoPlay: false)),),
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//
//         }else if(snapshot.hasError){
//           return Center(
//             child: Text('Server error', style: TextStyle(color: Colors.red[700]),),
//           );
//         }
//         else{
//           return const CircularProgressIndicator();
//         }
//       },
//     ),
//     );
//   }
//   String getVideo(content){
//     int idx = -1;
//     try {
//       idx = content.indexOf("<iframe");
//     } catch (e) {
//       print('There is an exception.');
//     }
//
//     if(idx!= -1){
//       var c1 =content.substring(idx+1).trim();
//       int i1  = c1.indexOf('src=');
//       if(i1 != -1){
//         var c2 =c1.substring(i1 +5).trim();
//         int i2  = c2.indexOf('" ');
//         return  c2.substring(0 ,i2).trim();
//       }else{return"-";}
//
//     }else{
//       return"-";
//     }
//
//   }
//   Future<Live?> getLivePage()async{
//     http.Response post =
//     await http.get(Uri.parse('https://ognreports.news//wp-json/wp/v2/pages/899'));
//     if(post.statusCode==200){
//       // print(posts.body);
//       //for list
//       // final parsed =json.decode(posts.body).cast<Map<String,dynamic>>();
//       // return parsed.map<Post>((item)=>Post.fromJson(item)).toList();
//       // for single post
//       return Live.fromJson(json.decode(post.body));
//     }else{
//       throw Exception('error');
//     }
//   }
// }
