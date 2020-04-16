import 'package:flutter_sound/track_player.dart';

class PlayerPageService {
  TrackPlayer trackPlayer;

  int trackNumber;

  void stopPlayer() {
    trackPlayer.stopPlayer();
  }

  Future startPlayer() async {
    
    initPlayer();
    print(trackNumber);
    await trackPlayer.startPlayerFromTrack(
      Track(
        trackPath: _songsList[0], // An example audio file
        trackTitle: "Track Title",
        trackAuthor: "Track Author",
        albumArtUrl:
            "https://file-examples.com/wp-content/uploads/2017/10/file_example_PNG_1MB.png", // An example image
      ),
      whenFinished: () {
        print('I hope you enjoyed listening to this song');
      },
      whenPaused: pausePlayer(),
      onSkipBackward: () {
        print('Skip backward');
        stopPlayer();
      },
      onSkipForward: () {
        print('Skip forward');
        stopPlayer();
      },
    );
  }

  void resumePlayer() {
    trackPlayer.resumePlayer();
  }

  pausePlayer() {
    trackPlayer.pausePlayer();
  }
  void aapuPlayer() {
    trackPlayer.pausePlayer();
  }

  void initPlayer() async {
    trackPlayer = await TrackPlayer().initialize();
  }

  List<String> _songsList = [
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
    "https://audioboom.com/posts/7552962.mp3?modified=1586457466",
  ];
}
