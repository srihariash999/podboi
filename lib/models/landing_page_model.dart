import 'package:scoped_model/scoped_model.dart';

import 'package:podboi/state_enums.dart';

class LandingPageModel extends Model {
  lpState _content = lpState.subscriptions;

    content ()
    {
      return _content;
    }

  tappedIcon(var p) {

    if (p == _content) {
      print("Content already displayed!!!!");
    } else {
      _content = p;
      notifyListeners();
    }
  }
}
