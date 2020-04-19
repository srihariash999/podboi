import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:flutter_sound/track_player.dart';

class PlayerPageService {
  FlutterSoundPlayer trackPlayer;

  int trackNumber;

  Future stopPlayer() async {
    await trackPlayer.stopPlayer();
  }

  Future startPlayer() async {
    print(trackNumber);
    // await trackPlayer.startPlayerFromTrack(
    //   Track(
    //     trackPath: _songsList[trackNumber],
    //     trackTitle: "Track Title",
    //     trackAuthor: "Track Author",
    //     albumArtUrl:
    //         "https://images.theabcdn.com/i/24025650.jpg", // An example image
    //   ),
    // );
    await trackPlayer.startPlayer(_songsList[trackNumber]);
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
