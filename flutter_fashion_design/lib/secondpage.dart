import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String heroTag;

  SecondPage({this.heroTag});

  @override
  _SecondPageState createState() => _SecondPageState(heroTag: heroTag);
}

class _SecondPageState extends State<SecondPage> {
  final heroTag;

  _SecondPageState({this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: heroTag,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image:
                AssetImage(heroTag),
                fit: BoxFit.cover)
              ),
            ),
          )
        ],
      ),
    );
  }
}
