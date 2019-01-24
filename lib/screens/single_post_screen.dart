import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SinglePostScreen extends StatefulWidget {
  final Map<String, Object> value;

  const SinglePostScreen({Key key, this.value}) : super(key: key);


  @override
  _SinglePostScreenState createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: TransitionToImage(
            AdvancedNetworkImage(
                '${widget.value['backdrop_path']}',
                loadFailedCallback: () {
                  print('Oh, no!');
                }, useDiskCache: true, retryLimit: 8),
            loadingWidget: SpinKitFoldingCube(
              color: Colors.green,
              size: 50.0,
            ),
            fit: BoxFit.cover,
            placeholder: const Icon(
              Icons.terrain,
              size: 100.0,
            )
        ),
      ),
    );
  }
}
