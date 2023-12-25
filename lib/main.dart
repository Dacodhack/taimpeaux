import 'package:flutter/material.dart';
import 'package:taimpeaux/pages/HomePage.dart';
import 'package:taimpeaux/pages/Prez.dart';
import 'package:taimpeaux/pages/Chrono.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}