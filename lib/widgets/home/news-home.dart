import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ogn_app/constant.dart';
import 'package:ogn_app/screens/news_detail_screen.dart';
import 'package:ogn_app/widgets/home/news-card.dart';

import '../../api/wp-news.dart';
import '../../models/post.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  late Future<List?> postData;

  @override
  void initState() {
    postData = getPost('https://ognreports.news/wp-json/wp/v2/news');
    super.initState();
  }

  void selectPost(int postId, String type) {
    Navigator.of(context)
        .pushNamed(NewsDetailsScreen.screenRoute, arguments: postId);
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Center(
      child: FutureBuilder<List?>(
        future: postData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 370,
                    // aspectRatio: 1/1,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 600),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder:
                      (BuildContext context, int i, int pageViewIndex) =>
                          InkWell(
                    onTap: () => selectPost(snapshot.data![i].id, 'news'),
                    child: newsCard(Post(
                        id: snapshot.data![i].id,
                        content: snapshot.data![i].content,
                        image: snapshot.data![i].image,
                        title: snapshot.data![i].title)),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 4, 15, 4),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
                    color: ognColor,
                    ),
                    child: const Text(
                      'Headlines',
                      style: TextStyle(
                          color: darkColor,fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Server error',
                style: TextStyle(color: Colors.red[700]),
              ),
            );
          } else {
            return const Center(
                child: Padding(
              padding: EdgeInsets.all(60),
              child: CircularProgressIndicator(),
            ));
          }
        },
      ),
    );
  }
}
