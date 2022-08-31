import 'package:flutter/material.dart';
import '../../constant.dart';

AppBar MyAppBar() {
  return AppBar(
    backgroundColor: darkColor,
    centerTitle: true,
    title: Image.asset(
      'images/1024.png',
      fit: BoxFit.cover,
      width: 60,
    ),
    // bottom: const TabBar(tabs: [
    //   Tab(
    //     text: 'OGN NEWS',
    //   )
    // ]),
    leading: const Icon(Icons.menu),
  );
}
