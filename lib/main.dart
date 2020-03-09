import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter_sound/flutter_sound.dart';

void main() {
  runApp(PodBoiApp());
}

class PodBoiApp extends StatefulWidget {
  @override
  _PodBoiAppState createState() => _PodBoiAppState();
}

class _PodBoiAppState extends State<PodBoiApp> {
  FlutterSound sound;

  String _centreButtonIcon = "play";
  bool _isPaused = false;
  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sound = FlutterSound();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sound playing test from scratch"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Container(
                    child: Icon(_centreButtonIcon == "play"
                        ? Icons.play_arrow
                        : Icons.pause),
                  ),
                  onPressed: () {
                    setState(() {
                      sound.startPlayer("https://goo.gl/5RQjTQ");
                    });
                  }),
              RaisedButton(
                  child: Container(child: Icon(Icons.stop)),
                  onPressed: () {
                    setState(() {
                      sound.stopPlayer();
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
