import 'package:flutter/material.dart';
import 'package:ogn_app/screens/home_screen.dart';
import 'package:ogn_app/screens/live_screen.dart';
import 'package:ogn_app/screens/post_detail_screen.dart';
import 'package:ogn_app/screens/news_screen.dart';
import 'package:ogn_app/screens/programs_screen.dart';
import '../api/wp-posts.dart';
import '../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List?> postData;

  @override
  void initState() {
    postData = getPost('https://ognreports.news/wp-json/wp/v2/posts');
    super.initState();
  }

  void selectPost(int postId, String title, String content, String image) {
    Navigator.of(context)
        .pushNamed(PostDetailsScreen.screenRoute, arguments: postId);
  }
  final _screens = [
    const homeScreen(),
    const NewsScreen(),
    const LiveScreen(),
    const ProgramsScreen(),


  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(children: _screens.asMap()
          .map((i, screen) => MapEntry(
          i,
          Offstage(offstage:_selectedIndex != i, child: screen))).values.toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        currentIndex: _selectedIndex,
        onTap: (i) => setState( () => _selectedIndex = i),
        // backgroundColor: darkColor,

        selectedFontSize: 12,
        selectedItemColor: ognColor,
        unselectedItemColor: Colors.grey[600],
        unselectedFontSize: 10,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: 'News',),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow_rounded),label: 'Live',),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded),label: 'Programs',),
      ],),
      backgroundColor: gray3Color,
      // body: homeCustomScrollView(),
      // appBar: MyAppBar(),
      // body: HomeBody(),
    );
  }


}
