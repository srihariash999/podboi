import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:podboi/models/player_page_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/state_enums.dart';
import 'package:scoped_model/scoped_model.dart';

class Player extends StatelessWidget {
  final int trackNumber;
  Player({this.trackNumber});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<PlayerPageModel>(
      model: locator<PlayerPageModel>(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.black,
                child: Placeholder(
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          child: Neumorphic(
                            boxShape: NeumorphicBoxShape.circle(),
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.skip_previous,
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ScopedModelDescendant<PlayerPageModel>(
                      builder: (context, child, model) {
                        model.initial(this.trackNumber);
                        stithi _currentState = model.getState();
                        IconData bomma;
                        if (_currentState == stithi.stopped) {
                          bomma = Icons.music_note;
                          print(
                              "got stopped................................................................................................................");
                        } else if (_currentState == stithi.paused) {
                          bomma = Icons.play_arrow;
                          print(
                              "got Paused................................................................................................................");
                        } else if (_currentState == stithi.playing) {
                          bomma = Icons.pause;
                          print(
                              "got Playing................................................................................................................");
                        } else if (_currentState == stithi.buffering) {
                          print(
                              "got Buffering................................................................................................................");
                          bomma = Icons.camera;
                        } else {
                          print("Thu na batuku" + _currentState.toString());
                        }

                        return Expanded(
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                model.buttonPressedAction();
                              },
                              child: Neumorphic(
                                boxShape: NeumorphicBoxShape.circle(),
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: _currentState == stithi.buffering
                                      ? Center(
                                        child: CircularProgressIndicator(
                                            backgroundColor: Colors.white,
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.black),
                                          ),
                                      )
                                      : Icon(
                                          bomma,
                                          color: Colors.black,
                                          size: 50,
                                        ),
                                ),
                              ),
                            ),
                            // IconButton(
                            //   icon: Icon(
                            //     bomma,
                            //     color: Colors.white,
                            //     size: 50,
                            //   ),
                            //   onPressed: () {
                            //     model.buttonPressedAction();
                            //   },
                            // ),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          child: Neumorphic(
                            boxShape: NeumorphicBoxShape.circle(),
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.skip_next,
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
