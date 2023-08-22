import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:pixie_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<ContentConfig> slides = [];
  static final String isOpened = "isOpened";
  bool openedState = false;

  //set whether screen has already shown
  Future<bool> setIsOpen(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isOpened, value);
  }

  Future<bool> getIsOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    openedState = prefs.getBool(isOpened) ?? false;
    if (openedState == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    print(openedState);
    return openedState;
  }

  @override
  void initState() {
    super.initState();
    slides.add(
      ContentConfig(
        title: "Welcome to Pixie",
        description:
            "We believe that your photograph worth a thousand of words without even saying any word.",
        styleTitle: TextStyle(color: Colors.green),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      ContentConfig(
        title: "Capture Moments",
        description:
            "Moment are rare. Capture each of these moments and share with the world.",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      ContentConfig(
        title: "PENCIL",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        backgroundColor: Colors.white,
      ),
    );
    getIsOpen();
  }

  void onDonePress() {
    setIsOpen(true);
    getIsOpen();
  }

  void onSkipPress() {
    setIsOpen(true);
    getIsOpen();
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      listContentConfig: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
