import 'package:flutter/material.dart';

class SinglePostScreen extends StatefulWidget {
  @override
  _SinglePostScreenState createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  var height = 45.0;
  var width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 5),
    );
  }
}
