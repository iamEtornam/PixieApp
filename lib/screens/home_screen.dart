import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pixie_app/screens/intro_screen.dart';
import 'package:pixie_app/screens/profile_screen.dart';
import 'package:pixie_app/screens/single_post_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentDate;
  var greetingOfDay;
  static final String isOpened = "isOpened";
  bool openedState = false;
  bool gettingData = false;
  List data;
  final String url =
      "https://pixabay.com/api/?key=11027419-3b7491979bc801685fa2b6ce3&q=nature&image_type=photo";

  //fetch data
  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      gettingData = true;
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['hits'];
      gettingData = false;
    });

    return "status: 200, message: OK";
  }

  //get intro status
  Future<bool> getIsOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    openedState = prefs.getBool(isOpened) ?? false;
    if (openedState == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    }
    print(openedState);
    return openedState;
  }

  @override
  void initState() {
    super.initState();
    this.getIsOpen();
    this.getJsonData();

    getCurrentDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Pixie',
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 5.0),
          itemCount: 1,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '$greetingOfDay Etornam',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$currentDate',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AdvancedNetworkImage(
                                    'https://pbs.twimg.com/profile_images/1080018978456653825/ezIWY_3T_400x400.jpg',
                                    useDiskCache: true,
                                    retryLimit: 8),
                                fit: BoxFit.fill)),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                data == null
                    ? Container(
                        height: 250.0,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'No Post',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 200.0,
                        child: Card(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: TransitionToImage(
                                  AdvancedNetworkImage(
                                      'https://pixabay.com/get/e83cb30820f0063ed1584d05fb1d4797e375e5d118b80c4090f4c97ba0e4b0bbd8_640.jpg',
                                      loadFailedCallback: () {
                                    print('Oh, no!');
                                    getJsonData();
                                  }, useDiskCache: true, retryLimit: 10),
                                  loadingWidget: SpinKitRipple(
                                    color: Colors.green,
                                    size: 50.0,
                                  ),
                                  fit: BoxFit.cover,
                                  placeholder: const Icon(
                                    Icons.error_outline,
                                    size: 80.0,
                                  )),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10.0,
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: data == null ? 0 : data.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SinglePostScreen(
                                            value: data[index])));
                              },
                              child: Container(
                                  child: Card(
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: TransitionToImage(
                                        AdvancedNetworkImage(
                                            '${data[index]['webformatURL']}?raw=true',
                                            loadFailedCallback: () {
                                          print('Oh, no!');
                                          getJsonData();
                                        }, useDiskCache: true, retryLimit: 10),
                                        loadingWidget: SpinKitRipple(
                                          color: Colors.green,
                                          size: 50.0,
                                        ),
                                        fit: BoxFit.cover,
                                        placeholder: const Icon(
                                          Icons.image,
                                          size: 100.0,
                                        )),
                                  ),
                                ),
                              ))),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(2, index.isEven ? 2 : 1),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ))
              ],
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(
          Icons.camera_enhance,
          color: Colors.white,
        ),
      ),
      resizeToAvoidBottomPadding: true,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.only(right: 30.0),
                icon: Icon(Icons.explore),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.only(left: 30.0),
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCurrentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMMd("en_US");
    currentDate = formatter.format(now).toUpperCase();

    var hourOfDay = TimeOfDay.now().hour;
    if (hourOfDay >= 0 && hourOfDay < 12) {
      //morning
      print('morning');
      greetingOfDay = "Good Morning, ";
    } else if (hourOfDay >= 12 && hourOfDay < 17) {
      //afternoon
      print('afternoon');
      greetingOfDay = "Good Afternoon, ";
    } else if (hourOfDay >= 17 && hourOfDay < 24) {
      //evening
      print('evening');
      greetingOfDay = "Good Evening, ";
    } else {
      //hello name
      print('hello bright');
      greetingOfDay = "Hello there, ";
    }
  }
}
