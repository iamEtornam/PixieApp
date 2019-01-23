import 'package:flutter/material.dart';
import 'package:pixie_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}
