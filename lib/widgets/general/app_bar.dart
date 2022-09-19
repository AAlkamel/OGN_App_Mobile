import 'package:flutter/material.dart';
import '../../constant.dart';

AppBar MyAppBar(String title) {
  return AppBar(
    elevation: 2,
    centerTitle: true,
    backgroundColor: ognColor,
    title:  Text(title),
    // actions: [
    //   IconButton(onPressed: ()=>{}, icon: const Icon(Icons.menu,))
    // ],
  );
}
