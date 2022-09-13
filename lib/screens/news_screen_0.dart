import 'package:flutter/material.dart';
import 'package:ogn_app/screens/news_detail_screen.dart';
import 'package:ogn_app/screens/post_detail_screen.dart';
import '../api/wp-posts.dart';
import '../models/post.dart';
import '../widgets/home/post-card.dart';
class NewsScreen0 extends StatefulWidget {
  const NewsScreen0({Key? key}) : super(key: key);

  @override
  State<NewsScreen0> createState() => _NewsScreen0State();
}

class _NewsScreen0State extends State<NewsScreen0> {
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
    return homeCustomScrollView();
  }
  CustomScrollView homeCustomScrollView() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          elevation: 2,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/1024.png',
              width: 40,
            ),
          ),
          actions: [
            IconButton(onPressed: ()=>{}, icon: Icon(Icons.menu_rounded,color: Colors.grey[600],))
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 0),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
                news()

              ])),
        )
      ],
    );
  }

  Center news() {
    return Center(
      child: FutureBuilder<List?>(
        future: postData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return Text(unescape.convert(snapshot.data![0].title));
            //return Text(snapshot.data![0].title);
            return Column(
              children: List<Widget>.generate(
                snapshot.data!.length,
                    (int index) {
                  return InkWell(
                    onTap: () => selectPost(
                        snapshot.data![index].id,
                        'posts'),
                    child: postCard(
                      Post(
                          id: snapshot.data![index].id,
                          content: snapshot.data![index].content,
                          image: snapshot.data![index].image,
                          title: snapshot.data![index].title),
                    ),
                  );
                },
              ).toList(),
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
