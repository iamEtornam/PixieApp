import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:pixie_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();
  static final String isOpened = "isOpened";
  bool openedState = false;

  //set whether screen has already shown
  Future <bool> setIsOpen(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isOpened, value);
  }

  Future<bool> getIsOpen() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    openedState = prefs.getBool(isOpened);
    if(openedState == true){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomeScreen()
      ));
    }
    print(openedState);
    return openedState;
  }


  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "ERASER",
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        styleTitle: TextStyle(
          color: Colors.green
        ),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",

        backgroundColor: Colors.white,
      ),
    );
    getIsOpen();
  }

  void onDonePress(){
    setIsOpen(true);
    getIsOpen();
  }

  void onSkipPress(){
    setIsOpen(true);
    getIsOpen();
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
