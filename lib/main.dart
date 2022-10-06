import 'package:flutter/material.dart';

import 'screens/homePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}


//5025882762493fc27b5293bbc4d3bdbf9a5fd26802e6727f7bb218ab5d3b5f27