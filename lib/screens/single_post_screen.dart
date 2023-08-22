import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_advanced_networkimage_2/transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SinglePostScreen extends StatefulWidget {
  final Map<String, Object> value;

  const SinglePostScreen({Key? key, required this.value}) : super(key: key);

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
            image: AdvancedNetworkImage('${widget.value['webformatURL']}',
                useDiskCache: true, retryLimit: 8),
            loadingWidget: SpinKitRipple(
              color: Colors.green,
              size: 100.0,
            ),
            fit: BoxFit.cover,
            placeholder: const Icon(
              Icons.terrain,
              size: 100.0,
            )),
      ),
    );
  }
}
