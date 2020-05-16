import 'dart:math';

import 'package:flutter_sound_lite/track_player.dart';
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
      await pausePlayer();
    }

    // If pressed when the player was paused

    else if (_state == stithi.paused) {
      await resumePlayer();
    }

    // If pressed when the player was stopped
    else if (_state == stithi.stopped) {
      _state = stithi.buffering;
      notifyListeners();
      print(
          "sent buffering %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
      await startPlayer();
      _state = stithi.playing;
      notifyListeners();
    }

    // If pressed when the player was buffering

    else if (_state == stithi.buffering) {
      print("Maybe reached here");
      await stopPlayer();
    }

    // Some unknown state which was encountered somehow !

    else {
      print(" Na kharma kaaliipoyindi ra");
      print(_state);
    }
  }

  pausedFromNotif() {}

  initial(int i) async {
    if (i != null) {
      print("Sending the info to player first time, trackno: $i");
      await initTrack(i);
    }
  }

  printIt(value) {
    print("I am in the then part with this value => " + value.toString());
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // All things that should be in a service but are here because I can't figure things out.

  TrackPlayer trackPlayer;
  int trackNumber;
  var duration;

  startPlayer() async {
    await initPlayer();
    await trackPlayer.startPlayerFromTrack(
      Track(
        trackPath: _songsList[trackNumber], // An example audio file
        trackTitle: "Track Title",
        trackAuthor: "Track Author",
        albumArtUrl:
            "https://file-examples.com/wp-content/uploads/2017/10/file_example_PNG_1MB.png", // An example image
      ),
      whenFinished: () {
        print('I hope you enjoyed listening to this song');
        stopPlayer();
      },
      onPaused: (bool e) async {
        if (e) {
          pausePlayer();
        }
        if (!e) {
          resumePlayer();
        }
      },
      onSkipBackward: () {
        print('Skip backward');
      },
      onSkipForward: () {
        print('Skip forward');
      },
    );
  }

  func() {
    print("something");
  }

  resumePlayer() async {
    await trackPlayer.resumePlayer();
    _state = stithi.playing;
    notifyListeners();
  }

  pausePlayer() async {
    await trackPlayer.pausePlayer();
    _state = stithi.paused;
    print("sent paused from notifs");
    notifyListeners();
  }

  stopPlayer() async {
    await trackPlayer.stopPlayer();
    trackPlayer.release();
    _state = stithi.stopped;
    notifyListeners();
  }

  initPlayer() {
    trackPlayer = TrackPlayer();
    trackPlayer.initialize();
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
