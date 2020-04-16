import 'dart:math';
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
     if (_state == stithi.playing) {
      playerPageService.pausePlayer();
      _state = stithi.paused;
      notifyListeners();
      print("sent paused %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    } else if (_state == stithi.paused) {
      playerPageService.resumePlayer();
      _state = stithi.playing;
      notifyListeners();
       print("sent playing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    }
    else if (_state == stithi.stopped) {
      _state = stithi.buffering;
      notifyListeners();
      print("sent buffering %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    await playerPageService.startPlayer();
    _state = stithi.playing;
      notifyListeners();
       print("sent playing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    }
    else if (_state == stithi.buffering) {
      print("Maybe reached here");
    }

    else
    {
      print(" Na kharma kaaliipoyindi ra");
      print(_state);
    }
  }

  initial(int i) {
    print(i);
  
  }
}
