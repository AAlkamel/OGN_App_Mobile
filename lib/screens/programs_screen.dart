import 'package:flutter/material.dart';
import 'package:ogn_app/constant.dart';
import 'package:ogn_app/screens/news_briefs_screen.dart';
import 'package:ogn_app/screens/palestine_matters_screen.dart';
import 'package:ogn_app/screens/perspectives_screen.dart';
import 'package:ogn_app/screens/tafsear_screen.dart';
import 'package:ogn_app/screens/the_source_screen.dart';

import '../widgets/general/app_drawer.dart';
import 'bk_show_screen.dart';
import 'justice_series_screen.dart';
import 'khutbah_screen.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({Key? key}) : super(key: key);

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  void selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    const TafsearScreen(),
    const TheSourceScreen(),
    const KhutbahScreen(),
    const PalestineScreen(),
    const NewsBriefsScreen(),
    const PerspectivesScreen(),
    const JusticeSeriesScreen(),
    const BKShowScreen(),
  ];
  final List<Tab> _tabs = [
    const Tab(text: 'Understanding the Quran Made Simple'),
    const Tab(text: 'The Source'),
    const Tab(text: 'Khutbah’s from Around the World'),
    const Tab(text: 'Palestine Matters'),
    const Tab(text: 'News Briefs'),
    const Tab(text: 'Perspectives'),
    const Tab(text: 'Justice Series'),
    const Tab(text: 'Weekly Q & A with Bilal Abdul Kareem'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        // drawer: AppDrawer(),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: darkColor,
        flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        TabBar(
        indicatorColor: yColor,
            // labelColor: yColor,
            isScrollable: true,
            tabs: _tabs,
    )
    ],
    ),
        ),

        body: TabBarView(
          children: _screens,
        ),
      ),
    );
  }
}
