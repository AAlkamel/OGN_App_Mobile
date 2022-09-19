import 'package:flutter/material.dart';
import 'package:ogn_app/constant.dart';
import 'package:ogn_app/screens/bk_show_screen.dart';
import 'package:ogn_app/screens/justice_series_screen.dart';
import 'package:ogn_app/screens/khutbah_screen.dart';
import 'package:ogn_app/screens/live_screen.dart';
import 'package:ogn_app/screens/news_briefs_screen.dart';
import 'package:ogn_app/screens/news_detail_screen.dart';
import 'package:ogn_app/screens/news_screen.dart';
import 'package:ogn_app/screens/palestine_matters_screen.dart';
import 'package:ogn_app/screens/perspectives_screen.dart';
import 'package:ogn_app/screens/tafsear_screen.dart';
import 'package:ogn_app/screens/the_source_screen.dart';
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
        accentColor: ognColor,

      ),

      // home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx)=> const HomeScreen(),
        PostDetailsScreen.screenRoute  :(ctx) => const PostDetailsScreen(),
        NewsDetailsScreen.screenRoute  :(ctx) => const NewsDetailsScreen(),
        NewsScreen.screenRoute         :(ctx) => const NewsScreen(),
        LiveScreen.screenRoute         :(ctx) => LiveScreen(),
        TafsearScreen.screenRoute      :(ctx) => TafsearScreen(),
        TheSourceScreen.screenRoute    :(ctx) => TheSourceScreen(),
        KhutbahScreen.screenRoute      :(ctx) => KhutbahScreen(),
        PalestineScreen.screenRoute    :(ctx) => PalestineScreen(),
        NewsBriefsScreen.screenRoute   :(ctx) => NewsBriefsScreen(),
        PerspectivesScreen.screenRoute :(ctx) => PerspectivesScreen(),
        JusticeSeriesScreen.screenRoute:(ctx) => JusticeSeriesScreen(),
        BKShowScreen.screenRoute       :(ctx) => BKShowScreen()

      },
    );
  }
}
