
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ogn_app/api/wp-single-post.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../constant.dart';
import '../models/post.dart';
import '../widgets/home/post-card.dart';
class PostDetailsScreen extends StatefulWidget {
 static const screenRoute = '/post-details';
  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
 late Future<Post?> post;
 late YoutubePlayerController _controller;
 late String video;
 late  String content = "-";
 @override
  void initState() {
   content = getVideo(content);
    _controller = YoutubePlayerController(initialVideoId: convertedUrl(content),flags: const YoutubePlayerFlags(autoPlay: false));

    super.initState();
  }
  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments as int;
    post = getSinglePost(postId);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[600]),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Center(
                  child:FutureBuilder<Post?>(
                    future: post,
                    builder: (context,snapshot){
                      if(snapshot.hasData) {
                        String s = (getVideo(snapshot.data!.content));
                        // return Text(unescape.convert(snapshot.data![0].title));
                        //return Text(snapshot.data![0].title);
                        return  Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image(
                                      image: NetworkImage(snapshot.data!.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    right: -5,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 8),
                                      margin: const EdgeInsets.only(right: 4),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(8),
                                          right: Radius.circular(0),
                                        ), //BorderRadius.horizontal,
                                        color: yColor,
                                      ),
                                      child: const Text(
                                        'tag',
                                        style: TextStyle(
                                          fontSize: fontSize * .75,
                                          color: darkColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        unescape.convert(

                                          snapshot.data!.title,
                                        ),
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: fontSize * .9,
                                          height: 1.3,
                                          letterSpacing: .15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 75,
                                      height: 2,
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    // TextButton(
                                    //   style: TextButton.styleFrom(
                                    //     textStyle: const TextStyle(fontSize: 20),
                                    //   ),
                                    //   onPressed: () {
                                    //     showConsoleUsingPrint(
                                    //         getVideo(snapshot.data!.content)
                                    //     );
                                    //
                                    //   },
                                    //   child: const Text('Enabled'),
                                    // ),
                                    Visibility(
                                      visible: (s!= "-"),
                                      child: YoutubePlayer(controller: YoutubePlayerController(initialVideoId: convertedUrl(getVideo(snapshot.data!.content)),flags: const YoutubePlayerFlags(autoPlay: false)),),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        child: Column(
                                          children: [

                                            Html(
                                                data: snapshot.data!.content,
                                                // customRenders: {},
                                                customRender: {
                                                  "iframe": (RenderContext context, Widget child) {
                                                    final attrs = context.tree.element?.attributes;
                                                    if (attrs != null) {
                                                      double? width = double.tryParse(attrs['width'] ?? "");
                                                      double? height = double.tryParse(attrs['height'] ?? "");
                                                      String? src = attrs['height'] ?? "";
                                                      video = src;
                                                      return SizedBox(
                                                        // width: width ?? (height ?? 150) * 2,
                                                        // height: height ?? (width ?? 300) / 2,
                                                        width: width ?? (height ?? 150) * 2,
                                                        height: 0,


                                                      );
                                                    } else {
                                                      return Container(height: 0);
                                                    }
                                                  }
                                                }
                                            ),
                                          ],
                                        )
                                      // WebView(
                                      //   initialUrl: Uri.dataFromString('<html><body><iframe src="https://www.youtube.com/embed/abc"></iframe></body></html>', mimeType: 'text/html').toString(),
                                      //   javascriptMode: JavascriptMode.unrestricted,
                                      // )
                                      // Text(
                                      //   snapshot.data!.content
                                      //   ,              style: TextStyle(
                                      //   color: Colors.grey[700],
                                      //   fontWeight: FontWeight.normal,
                                      //   fontSize: fontSize * .9,
                                      //   height: 1.3,
                                      //   letterSpacing: .15,
                                      // ),
                                      // ),
                                    ),
                                    // Row(
                                    //   children: List<Widget>.generate(
                                    //     tags.length,
                                    //         (int idx) {
                                    //       return Container(
                                    //         padding: const EdgeInsets.symmetric(
                                    //             vertical: 2, horizontal: 8),
                                    //         margin: EdgeInsets.only(right: 4),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(10),
                                    //           color: yColor,
                                    //         ),
                                    //         child: Text(
                                    //           tags[idx],
                                    //           style: const TextStyle(
                                    //             fontSize: fontSize * .75,
                                    //             color: darkColor,
                                    //           ),
                                    //         ),
                                    //       );
                                    //     },
                                    //   ).toList(),
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );

                      }else if(snapshot.hasError){
                        return Center(
                          child: Text('Server error', style: TextStyle(color: Colors.red[700]),),
                        );
                      }
                      else{
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                )
            ),
          );
        },
      ),

    );
  }

  // functions
 String convertedUrl(url){
   return YoutubePlayer.convertUrlToId(url).toString();
 }
 String getYouTubeUrl(String content) {
   RegExp regExp = RegExp(
       r'((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?'
   );
   String? matches = regExp.stringMatch(content);
   if (matches == null) {
     return ''; // Always returns here while the video URL is in the content paramter
   }
   final String youTubeUrl = matches;
   return youTubeUrl;
 }
 void showConsoleUsingPrint(text) {

   print(text);
 }
 String getVideo(content){
   int idx = -1;
   try {
      idx = content.indexOf("<iframe");
   } catch (e) {
     print('There is an exception.');
   }

   if(idx!= -1){
     var c1 =content.substring(idx+1).trim();
     int i1  = c1.indexOf('src=');
     if(i1 != -1){
       var c2 =c1.substring(i1 +5).trim();
       int i2  = c2.indexOf('" ');
       return  c2.substring(0 ,i2).trim();
     }else{return"-";}

   }else{
     return"-";
   }

 }
}




