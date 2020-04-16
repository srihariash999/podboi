import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podboi/views/player_page_view.dart';
import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageModel extends Model {
  int x;

  String getAuthor(i) {
    if (i == x) return "Stinker";
    return "SOme author for" + i.toString();
  }

  String getCoverArt(i) {
    return "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80";
  }

  String getTitle(i) {
    if (i == x) return "Pooper";
    return "Some Title for" + i.toString();
  }

  int getLength() {
    return 10;
  }

  tappedAction(BuildContext context, i) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Player(
          trackNumber: i,
        ),
      ),
    );
  }
}
