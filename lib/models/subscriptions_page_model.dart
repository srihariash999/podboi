import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/services/subscriptions_page_service.dart';
import 'package:podboi/views/player_page_view.dart';

import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageModel extends Model {
  SubscriptionsPageService subscriptionsPageService =
      locator<SubscriptionsPageService>();
  int x;

  String _imageLoadingState = "notLoaded";

  String _view = "gridview";

  getImageLoadingState() {
    return _imageLoadingState;
  }

  String getView() {
    return _view;
  }

  String getAuthor(i) {
    if (i == x) return "Stinker";
    return "SOme author for" + i.toString();
  }

  startLoadingImages() async {
    if (imageURLS.length == 0) {
      print("Starting to load images");
      _imageLoadingState = "loading";
      notifyListeners();

      for (String i in podcastURLs) {
        String n = await subscriptionsPageService.getCoverArtURL(i);
        imageURLS.add(n);
      }

      _imageLoadingState = "loaded";
      print("Images loaded");
      notifyListeners();
    }
  }

  getCoverArt(i) {
    if (i <= imageURLS.length) return imageURLS[i];
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

  List<String> imageURLS = [];

  List<String> podcastURLs = [
    "http://wolf359radio.libsyn.com/rss",
    "https://audioboom.com/channels/2399216.rss",
    "https://feeds.megaphone.fm/lore",
    "https://www.npr.org/rss/podcast.php?id=344098539",
    "http://thesparkgap.libsyn.com/rss",
    "https://rss.wbur.org/endlessthread/podcast",
    "http://lpotl.libsyn.com/rss",
    "https://feeds.simplecast.com/pgsclD_d",
    "https://albasalix.libsyn.com/rss",
    "http://feeds.wnyc.org/tnyfiction"
  ];
}
