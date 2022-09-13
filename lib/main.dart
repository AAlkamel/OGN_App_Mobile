import 'package:flutter/material.dart';
import 'package:ogn_app/constant.dart';
import 'package:ogn_app/screens/news_detail_screen.dart';
import './screens/post_detail_screen.dart';
import './screens/main_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
      brightness: Brightness.light,
        primaryColor: ognColor,
      ),

      // home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx)=> const HomeScreen(),
        PostDetailsScreen.screenRoute :(ctx) => const PostDetailsScreen(),
        NewsDetailsScreen.screenRoute :(ctx) => const NewsDetailsScreen(),
      },
    );
  }
}
