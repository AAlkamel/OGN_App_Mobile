import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ogn_app/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ogn_app/widgets/home/post-card.dart';

import '../../api/wp-posts.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageWidth = width - 12.0;
    List<String> tags = [
      'tags 01',
      'tags 02',
      'tags 03',
    ];
    Future<List> _loadData() async {
      List posts = [];
      try {
        // This is an open REST API endpoint for testing purposes
        const apiUrl = 'https://ognreports.news/wp-json/wp/v2/posts';

        final http.Response response = await http.get(Uri.parse(apiUrl));
        posts = json.decode(response.body);
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }

      return posts;
    }
    return SafeArea(
      child: FutureBuilder(
          future: fetchPosts(),
          builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
          snapshot.hasData
              ? ListView.builder(
            // render the list
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, index) => Card(
              margin: const EdgeInsets.all(10),
              // render list item
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(snapshot.data![index]['title']['rendered'],style: TextStyle(color: Colors.amber),),
                // subtitle: Text(snapshot.data![index]['body']),
              ),
            ),
          )
              : const Center(
            // render the loading indicator
            child: CircularProgressIndicator(),
          ),
      )
    );
  }
}
