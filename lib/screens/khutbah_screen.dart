import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ogn_app/screens/post_detail_screen.dart';

import '../models/post.dart';
import '../widgets/general/app_bar.dart';
import '../widgets/general/app_drawer.dart';
import '../widgets/home/post-card.dart';
import 'news_detail_screen.dart';

class KhutbahScreen extends StatefulWidget {
  static const screenRoute = '/khutbah';
  const KhutbahScreen({Key? key}) : super(key: key);

  @override
  State<KhutbahScreen> createState() => _KhutbahScreenState();
}

class _KhutbahScreenState extends State<KhutbahScreen> {
// We will fetch data from this Rest api
// final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  final _baseUrl = 'https://ognreports.news/wp-json/wp/v2/posts?categories=203';

// At the beginning, we fetch the first 20 posts
  int _page = 1;

// you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 10;

// There is next page or not
  bool _hasNextPage = true;

// Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

// Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

// This holds the posts fetched from the server
  List _posts = [];

// This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
      await http.get(Uri.parse("$_baseUrl&page=$_page"));
      setState(() {
        _posts = json.decode(res.body);
        if (kDebugMode) {
          print(_posts);
        }
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

// This function will be triggered whenever the user scroll
// to near the bottom of the list view
  void _loadMore() async {
    // _page += 1; // Increase _page by 1
    if (
    _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false ) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res =
        await http.get(Uri.parse("$_baseUrl?page=$_page"));
        // await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));

        final List fetchedPosts = json.decode(res.body);
        final Map<String, String> headers =  res.headers;
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
// This means there is no more data
// and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

// The controller for the ListView
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }
  void selectPost(int postId, String type) {
    Navigator.of(context)
        .pushNamed(PostDetailsScreen.screenRoute, arguments: postId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: MyAppBar('Khutbah’s from Around the World'),
      body: _isFirstLoadRunning
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: _posts.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () => selectPost(
                    _posts[index]['id'],
                    'posts'),
                child: postCard(
                  Post(
                      id: _posts[index]['id'],
                      content: _posts[index]['content']['rendered'],
                      image:_posts[index]['better_featured_image']['source_url'],
                      // 'https://i.picsum.photos/id/866/1280/720.jpg?hmac=kfyiYNokOFMcfgqjn74ycjuYX5nBOtmyoVYS7JXvweM',
                      title: _posts[index]['title']['rendered']),
                ),
              ),

              //     Card(
              //   margin: const EdgeInsets.symmetric(
              //       vertical: 8, horizontal: 10),
              //   child: ListTile(
              //     title: Text(_posts[index]['title']['rendered']),
              //     // subtitle: Text(_posts[index]['body']),
              //   ),
              // ),
            ),
          ),

// when the _loadMore function is running
          if (_isLoadMoreRunning == true)
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),

// When nothing else to load
          if (_hasNextPage == false)
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 40),
              color: Colors.amber,
              child: const Center(
                child: Text('You have fetched all of the content'),
              ),
            ),
        ],
      ),
    );
  }
}
