
import 'package:flutter/material.dart';
import '../../screens/bk_show_screen.dart';
import '../../screens/justice_series_screen.dart';
import '../../screens/khutbah_screen.dart';
import '../../screens/live_screen.dart';
import '../../screens/news_briefs_screen.dart';
import '../../screens/news_screen.dart';
import '../../screens/palestine_matters_screen.dart';
import '../../screens/perspectives_screen.dart';
import '../../screens/tafsear_screen.dart';
import '../../screens/the_source_screen.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(child: Image(image: AssetImage('images/1024.png')),),
            ),
          ),
          Expanded(
            child:  ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                ListTile(

                  title: const Text('Home'),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/');
                  },
                ),
                ListTile(
                  title: const Text('News'),
                  onTap: () {
                    Navigator.of(context).pushNamed(NewsScreen.screenRoute);
                  },
                ),
                ListTile(
                  title: const Text('Live'),
                  onTap: () {
                    Navigator.of(context).pushNamed(LiveScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('Understanding the Quran Made Simple'),
                  onTap: () {
                    Navigator.of(context).pushNamed(TafsearScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('The Source'),
                  onTap: () {
                    Navigator.of(context).pushNamed(TheSourceScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('Khutbah’s from Around the World'),
                  onTap: () {
                    Navigator.of(context).pushNamed(KhutbahScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('Palestine Matters'),
                  onTap: () {
                    Navigator.of(context).pushNamed(PalestineScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('News Briefs'),
                  onTap: () {
                    Navigator.of(context).pushNamed(NewsBriefsScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('Perspectives'),
                  onTap: () {
                    Navigator.of(context).pushNamed(PerspectivesScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('Justice Series'),
                  onTap: () {
                    Navigator.of(context).pushNamed(JusticeSeriesScreen.screenRoute);
                  },
                ),ListTile(
                  title: const Text('Weekly Q & A with Bilal Abdul Kareem'),
                  onTap: () {
                    Navigator.of(context).pushNamed(BKShowScreen.screenRoute);
                  },
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}
