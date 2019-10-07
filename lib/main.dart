import 'package:flutter/material.dart';
import 'package:flutter_github/tabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Github',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Tabbar(),
    );
  }
}
