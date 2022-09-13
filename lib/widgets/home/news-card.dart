import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:ogn_app/constant.dart';
import 'package:html/parser.dart' show parse;
// import 'package:html/dom.dart';
import '../../models/post.dart';
var unescape = HtmlUnescape();
String wordNum(String content,int num){
  List<String> wordList = content.split(" ");
  String trimContent ="";
  for (int i = 0; i < num ; i++) {
    trimContent = trimContent + " " + wordList[i];
  }
  return trimContent ;
}
Container newsCard(Post post ){
  return
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        // color: Colors.yellowAccent,
        child: Card(
          color: darkColor,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(5.0),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                      image: NetworkImage(post.image),
                      fit: BoxFit.cover,
                    ),
                  ),

                ],
              ),
                  SizedBox(height: 1,child: Container(color: ognColor,),),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Text(
                        textAlign: TextAlign.center,
                        unescape.convert(

                          post.title,
                        ),
                        style: const TextStyle(
                          color: yColor,

                          // fontWeight: FontWeight.bold,
                          fontSize: 13,
                          height: 1.3,
                          letterSpacing: .15,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child:
                      // Html(
                      //     data: post.content,
                      //     customRender: {
                      //       "iframe": (RenderContext context, Widget child) {
                      //         final attrs = context.tree.element?.attributes;
                      //         if (attrs != null) {
                      //           double? width = double.tryParse(attrs['width'] ?? "");
                      //           double? height = double.tryParse(attrs['height'] ?? "");
                      //           String? src = attrs['height'] ?? "";
                      //           // video = src;
                      //           return SizedBox(
                      //             // width: width ?? (height ?? 150) * 2,
                      //             // height: height ?? (width ?? 300) / 2,
                      //             width: width ?? (height ?? 150) * 2,
                      //             height: 0,
                      //
                      //
                      //           );
                      //         } else {
                      //           return Container(height: 0);
                      //         }
                      //       }
                      //     }
                      // ),
                      Text(
                        // textAlign: TextAlign.center,
                        unescape.convert(
                            wordNum(parse(post.content).getElementsByTagName('p')[0].innerHtml,23)

                          // post.content,
                        ),
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          height: 1.3,
                          letterSpacing: .15,
                        ),
                      ),
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
        ),
      );

  //function

}