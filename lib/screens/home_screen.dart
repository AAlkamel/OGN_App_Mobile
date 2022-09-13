import 'package:flutter/material.dart';
import 'package:ogn_app/screens/post_detail_screen.dart';
import 'package:ogn_app/widgets/home/news-home.dart';
import 'package:ogn_app/widgets/home/recent_home.dart';

import '../api/wp-posts.dart';
import '../constant.dart';
import '../models/post.dart';
import '../widgets/general/app_bar.dart';
import '../widgets/home/post-card.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late Future<List?> postData;

  @override
  void initState() {
    postData = getPost('https://ognreports.news/wp-json/wp/v2/posts');
    super.initState();
  }

  void selectPost(int postId, String type) {
    Navigator.of(context)
        .pushNamed(PostDetailsScreen.screenRoute, arguments: postId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Home'),
      body: ListView(children: const [
        NewsHome(),
        RecentHome()
      ],),
    );
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
                const NewsHome(),
                const RecentHome()
                // Divider(),
                // postsHome(),
              ])),
        )
      ],
    );
  }

  Column postsHome() {
    return Column(
      children: [
        Container(

          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(20, 16, 0, 0),

          child:Column(
            children: [
              Container(

                padding: const EdgeInsets.fromLTRB(20, 5, 15, 5),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: ognColor,width: 1)),
                  color: yColor,
                  // borderRadius: BorderRadius.circular.a)
                ),
                child: const Text('Recent Posts' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

              ),
            ],
          ) ,
        ),
        Center(
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
        ),
      ],
    );
  }
}
