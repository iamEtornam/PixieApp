import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:pixie_app/screens/intro_screen.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final String isOpened = "isOpened";
  bool openedState = false;
  bool gettingData = false;
  List data;
  final String url =
      "https://pixabay.com/api/?key=11027419-3b7491979bc801685fa2b6ce3&q=yellow+flowers&image_type=photo&pretty=true";

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(3, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(4, 1),
  ];

  //fetch data
  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      gettingData = true;
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['hits'];
    });

    setState(() {
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
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
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
                              'Good Morning, Etornam',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'WEDNESSDAY, JANUARY 23',
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
                            width: 50.0,
                            height: 50.0,
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
                          onTap: (){},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: DecorationImage(image: AdvancedNetworkImage(
                          'https://pixabay.com/get/e83cb30820f1023ed1584d05fb1d4797e375e5d118b80c4090f4c97ba1edb4bbdf_1280.jpg',
                          useDiskCache: true,
                          retryLimit: 8),
                      fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    gettingData
                        ? CircularProgressIndicator()
                        : Flexible(
                            fit: FlexFit.loose,
                            child: StaggeredGridView.countBuilder(
                              crossAxisCount: 4,
                              itemCount: 8,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) =>
                                  new Container(
                                      child: Card(
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: TransitionToImage(
                                          AdvancedNetworkImage(
                                              '${data[index]['largeImageURL']}?raw=true',
                                              loadFailedCallback: () {
                                            print('Oh, no!');
                                            getJsonData();
                                          }),
                                          loadingWidget:
                                          GlowingProgressIndicator(
                                            child: Icon(Icons.image),
                                          ),
                                          fit: BoxFit.contain,
                                          placeholder: const Icon(Icons.image),
                                          width: 120.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  )),
                              staggeredTileBuilder: (int index) =>
                                  new StaggeredTile.count(
                                      2, index.isEven ? 2 : 1),
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                            ))
                  ],
                );
              }),
        ));
  }
}
