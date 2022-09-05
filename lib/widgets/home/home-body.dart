import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:ogn_app/models/post.dart';
import 'package:ogn_app/screens/post_detail_screen.dart';
import 'package:ogn_app/widgets/home/post-card.dart';
import '../../api/wp-posts.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late Future<List<Post>?> postData;
  @override
  initState(){
    super.initState();
    postData = getPost();
  }
  void selectPost(int postId){
    Navigator.of(context).pushNamed(PostDetailsScreen.screenRoute , arguments:postId);
  }
  @override
  Widget build(BuildContext context) {
    var unescape = HtmlUnescape();

    double width = MediaQuery.of(context).size.width;
    double imageWidth = width - 12.0;

    return SafeArea(
      child: Center(
        child:FutureBuilder<List<Post>?>(
          future: postData,
          builder: (context,snapshot){
            if(snapshot.hasData){
              // return Text(unescape.convert(snapshot.data![0].title));
              //return Text(snapshot.data![0].title);
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder:(context,index){
                   // return Text(unescape.convert(snapshot.data![index].title));
                    return InkWell(
                      onTap:() => selectPost(snapshot.data![index].id),
                      child: postCard(Post(id: snapshot.data![index].id, content: snapshot.data![index].content, image: snapshot.data![index].image, title: snapshot.data![index].title),),
                    );
                  }
              );
            }else if(snapshot.hasError){
              return Center(
                child: Text('Server error', style: TextStyle(color: Colors.red[700]),),
              );
            }
            else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
