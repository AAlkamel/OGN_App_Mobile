import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:ogn_app/constant.dart';

import '../../models/post.dart';
var unescape = HtmlUnescape();
Column postCard(Post post){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
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
                  // Positioned(
                  //   top: 15,
                  //   right: -5,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 2, horizontal: 8),
                  //     margin: const EdgeInsets.only(right: 4),
                  //     decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.horizontal(
                  //         left: Radius.circular(8),
                  //         right: Radius.circular(0),
                  //       ), //BorderRadius.horizontal,
                  //       color: yColor,
                  //     ),
                  //     child: const Text(
                  //       'tag',
                  //       style: TextStyle(
                  //         fontSize: fontSize * .75,
                  //         color: darkColor,
                  //       ),
                  //     ),
                  //   ),
                  // )
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
                    // const SizedBox(
                    //   width: 75,
                    //   height: 2,
                    //   child: Divider(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    //   child: Text(
                    //     'Renewed strikes and protests by medical staff in Al-Rai and Afreen hospitals in Aleppo, northern Syria due to perceived inequitable treatment between Turkish and Syrian staff and inadequate wages.',
                    //     style: TextStyle(
                    //       color: Colors.grey[700],
                    //       fontWeight: FontWeight.normal,
                    //       fontSize: fontSize * .9,
                    //       height: 1.3,
                    //       letterSpacing: .15,
                    //     ),
                    //   ),
                    // ),
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
      ),
    ],
  );
}