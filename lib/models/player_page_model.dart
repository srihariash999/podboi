import 'dart:math';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/services/player_page_service.dart';
import 'package:podboi/state_enums.dart';
import 'package:scoped_model/scoped_model.dart';

var randomPooper = Random();

class PlayerPageModel extends Model {
  PlayerPageService playerPageService = locator<PlayerPageService>();

  stithi _state = stithi.stopped;

  getState() {
    return _state;
  }

  buttonPressedAction() async {
    // If pressed when the player was playing

    if (_state == stithi.playing) {
      await aapuPlayer();
      _state = stithi.paused;
      notifyListeners();
      print(
          "sent paused %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    }

    // If pressed when the player was paused

    else if (_state == stithi.paused) {
      await resumePlayer();
      _state = stithi.playing;
      notifyListeners();
      print(
          "sent playing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    }

    // If pressed when the player was stopped
    else if (_state == stithi.stopped) {
      _state = stithi.buffering;
      notifyListeners();
      print(
          "sent buffering %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
      startPlayer();
    }

    // If pressed when the player was buffering

    else if (_state == stithi.buffering) {
      print("Maybe reached here");
      await onFinishedCallback();
      // _state = stithi.stopped;
      // notifyListeners();
    }

    // Some unknown state which was encountered somehow !

    else {
      print(" Na kharma kaaliipoyindi ra");
      print(_state);
    }
  }

  pausedFromNotif() {}
  initial(int i) async {
    print("Sending the info to player first time, trackno: $i");
    await initTrack(i);
  }

  printIt(value) {
    print("I am in the then part with this value => " + value.toString());
  }

  onDurationCallBack(double e) {
    print(e);
    _state = stithi.playing;
    notifyListeners();
    print(
        "sent playing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
  }

  onPositionCallback(e) {
    print(e);
  }

  onFinishedCallback()
  {
     audio.dispose();
     _state = stithi.stopped;
     notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // All things that should be in a service but are here because I can't figure things out.

  Audio audio;
  int trackNumber;
  var duration;



  startPlayer() {
    audio = Audio.loadFromRemoteUrl(_songsList[trackNumber],
        playInBackground: true, onDuration: (e) {
      onDurationCallBack(e);
    }, onPosition: (e) {
      onPositionCallback(e);
    }, onComplete: () {
      onFinishedCallback();
    });

    audio.play();
  }

  Future resumePlayer() async {
    audio.resume();
  }

  pausePlayer() {}

  // 'Aapu' is telugu for stop. I know it doesn't exactly fit, but its like 'roko' in hindi.

  Future aapuPlayer() async {
    await audio.pause();
  }

  initTrack(int i) {
    trackNumber = i;
    print("Player page service initialized tracknumber as: $i");
  }

  List<String> _songsList = [
    "http://traffic.libsyn.com/astronomycast/AstroCast-200413.mp3?dest-id=11189",
    "https://audioboom.com/posts/7540863.mp3?modified=1585340832",
    "https://www.barbneal.com/wp-content/uploads/spock03.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock04.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock05.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock06.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock07.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock08.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock09.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock10.mp3",
  ];
}
