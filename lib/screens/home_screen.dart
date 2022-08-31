import 'package:flutter/material.dart';
import '../widgets/general/app_bar.dart';
import '../constant.dart';
import '../widgets/home/home-body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray3Color,
      appBar: MyAppBar(),
      body: HomeBody(),
    );
  }
}
