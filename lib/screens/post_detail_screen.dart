import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ogn_app/api/wp-single-post.dart';

import '../constant.dart';
import '../models/post.dart';
import '../widgets/home/post-card.dart';

class PostDetailsScreen extends StatelessWidget {
 static const screenRoute = '/post-details';
 late Future<Post?> post;
  @override
  Widget build(BuildContext context) {

    final postId = ModalRoute.of(context)!.settings.arguments as int;
    post = getSinglePost(postId);
    return Scaffold(
      appBar: AppBar(backgroundColor: ognColorDark,),
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
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: Column(
                                      children: [

                                        Html(
                                          data: snapshot.data!.content,
                                            customRender: {
                                              "iframe": (RenderContext context, Widget child) {
                                                final attrs = context.tree.element?.attributes;
                                                if (attrs != null) {
                                                  double? width = double.tryParse(attrs['width'] ?? "");
                                                  double? height = double.tryParse(attrs['height'] ?? "");
                                                  String? src = attrs['height'] ?? "";
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
}


