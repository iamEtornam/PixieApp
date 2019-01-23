import 'package:flutter/material.dart';
import 'package:pixie_app/screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final String isOpened = "isOpened";
  bool openedState = false;

  Future<bool> getIsOpen() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    openedState = prefs.getBool(isOpened) ?? false;
    if(openedState == false){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => IntroScreen()
      ));
    }
    print(openedState);
    return openedState;
  }

  @override
  void initState() {
    super.initState();
    getIsOpen();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
