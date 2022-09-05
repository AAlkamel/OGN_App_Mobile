import 'package:flutter/material.dart';
import '../../constant.dart';

AppBar MyAppBar() {
  return AppBar(
    backgroundColor: ognColorDark,
    centerTitle: false,
    title:
    // Text('OGN'),
    Image.asset(
      'images/1024.png',
      fit: BoxFit.cover,
      width: 60,
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.menu),
        tooltip: '',
        onPressed: () {

        },
      ),
    ],
    // bottom: const TabBar(tabs: [
    //   Tab(
    //     text: 'OGN NEWS',
    //   )
    // ]),

  );
}
