import 'package:flutter_sound/track_player.dart';

class PlayerPageService {
  TrackPlayer trackPlayer;

  int trackNumber;

  Future stopPlayer() async {
   await trackPlayer.stopPlayer();
  }

  Future startPlayer() async {
    print(trackNumber);
    await trackPlayer.startPlayerFromTrack(
        Track(
          trackPath: _songsList[trackNumber],
          trackTitle: "Track Title",
          trackAuthor: "Track Author",
          albumArtUrl:
              "https://file-examples.com/wp-content/uploads/2017/10/file_example_PNG_1MB.png", // An example image
        ),
        whenFinished: tellModel());
  }

  Future resumePlayer() async {
    await trackPlayer.resumePlayer();
  }

  pausePlayer() {}

  // 'Aapu' is telugu for stop. I know it doesn't exactly fit, but its like 'roko' in hindi.

  Future aapuPlayer() async {
    await trackPlayer.pausePlayer();
  }

  Future initPlayer(int i) async {
    trackPlayer = await TrackPlayer().initialize();
    trackNumber = i;
  }

  List<String> _songsList = [
    "http://traffic.libsyn.com/astronomycast/AstroCast-200413.mp3?dest-id=11189",
    "https://www.barbneal.com/wp-content/uploads/spock02.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock03.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock04.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock05.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock06.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock07.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock08.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock09.mp3",
    "https://www.barbneal.com/wp-content/uploads/spock10.mp3",
  ];

  tellModel() {
    return true;
  }
}
