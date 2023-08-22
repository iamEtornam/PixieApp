import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_advanced_networkimage_2/transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:pixie_app/screens/edit_profile_screen.dart';
import 'package:pixie_app/screens/single_post_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  List? data;
  static var apiKey = "(YOUR-API-KEY-HERE)";
  final String url =
      "https://pixabay.com/api/?key=$apiKey&q=buildings&image_type=photo";

  //fetch data
  Future<String> getJsonData() async {
    var response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['hits'];
    });

    return "status: 200, message: OK";
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _globalKey.currentState?.openEndDrawer()),
        ],
      ),
      endDrawer: Drawer(
          child: Container(
        color: Colors.green,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            ListTile(
              title: Text(
                'Setting here',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              leading: Icon(
                Icons.settings,
                size: 40.0,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                'Setting here',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              leading: Icon(
                Icons.settings,
                size: 40.0,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                'Setting here',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              leading: Icon(
                Icons.settings,
                size: 40.0,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                'Setting here',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              leading: Icon(
                Icons.settings,
                size: 40.0,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                'Setting here',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              leading: Icon(
                Icons.settings,
                size: 40.0,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      )),
      body: ListView.builder(
          itemCount: 1,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//                  Align(
//                    child: IconButton(
//                        icon: Icon(
//                          Icons.edit,
//                          color: Colors.green,
//                        ),
//                        onPressed: () {}),
//                    alignment: Alignment.centerRight,
//                  ),
                FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 10.0,
                      ),
                      Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          height: 80.0,
                          width: 80.0,
                          color: Colors.green,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${data == null ? 0 : data!.length}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Post(s)',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 10.0,
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
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
                      Container(
                        width: 10.0,
                      ),
                      Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          height: 80.0,
                          width: 80.0,
                          color: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '220',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Following',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'Etornam Sunu',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Center(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                  child: Text(
                    'Software Engineer and Cyber Security Specialist',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(color: Colors.grey),
                  ),
                )),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => print('hello'),
                      child: new Container(
                        //width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                            child: Text(
                              'Message(s)',
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    InkWell(
                      onTap: () => print('hello'),
                      child: new Container(
                        //width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.green, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                            child: Text(
                              'Following',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/ic_twitter.png'))),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/ic_instagram.png'))),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/ic_snapchat.png'))),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 8.0),
                  child: Text(
                    'My Posts',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: data == null
                        ? Center(
                            child: Text(
                              'No Post',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              crossAxisCount: 2,
                              children: List.generate(
                                  data == null ? 0 : data!.length, (index) {
                                return GestureDetector(
                                  child: Card(
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: TransitionToImage(
                                            image: AdvancedNetworkImage(
                                                '${data?[index]['webformatURL']}?raw=true',
                                                loadFailedCallback: () {
                                              print('Oh, no!');
                                              getJsonData();
                                            },
                                                useDiskCache: true,
                                                retryLimit: 10),
                                            loadingWidget: SpinKitRipple(
                                              color: Colors.green,
                                              size: 50.0,
                                            ),
                                            fit: BoxFit.cover,
                                            placeholder: const Icon(
                                              Icons.terrain,
                                              size: 100.0,
                                            )),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SinglePostScreen(
                                                    value: data![index])));
                                  },
                                );
                              }),
                            ),
                          )),
              ],
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()));
        },
        mini: true,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
