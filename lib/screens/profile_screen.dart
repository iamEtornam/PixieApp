import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:pixie_app/screens/single_post_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List data;
  final String url =
      "https://pixabay.com/api/?key=11027419-3b7491979bc801685fa2b6ce3&q=buildings&image_type=photo";

  //fetch data
  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
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
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
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
                              '20',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Posts',
                              softWrap: true,
                              style: TextStyle(color: Colors.white,
                              fontSize: 10.0),
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
                              style: TextStyle(color: Colors.green,
                              fontSize: 10.0),
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
                        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                        child: Text(
                          'Message',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
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
                        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                        child: Text(
                          'Following',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
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
                            image: AssetImage('assets/images/ic_twitter.png'))),
                  ),
                ),
                SizedBox(width: 5.0,),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/ic_instagram.png'))),
                  ),
                ),
                SizedBox(width: 5.0,),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/ic_snapchat.png'))),
                  ),
                ),
                OrientationBuilder(builder: (context, orientation){
                  return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
                      itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      child: Container(
                          child: Card(
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10.0),
                                child: TransitionToImage(
                                    AdvancedNetworkImage(
                                        '${data[index]['webformatURL']}?raw=true',
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
                                      Icons.image,
                                      size: 100.0,
                                    )),
                              ),
                            ),
                          )),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SinglePostScreen(value: data[index]),
                            ));
                      },
                    );
                      });
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
