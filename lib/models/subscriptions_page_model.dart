import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/services/subscriptions_page_service.dart';
import 'package:podboi/views/player_page_view.dart';
import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageModel extends Model {
  SubscriptionsPageService subscriptionsPageService =
      locator<SubscriptionsPageService>();

  String _imageLoadingState = "notLoaded";

  String _view = "gridview";

  getImageLoadingState() {
    return _imageLoadingState;
  }

  String getView() {
    return _view;
  }

  //TODO:  Chnage the startLoadingImages logic, if the urls are in database, fetch it from there and not internet everytime.
  //TODO: WHen the above logic is changed, try returning urls to each grid seperately.

  startLoadingImages() async {
    if (imageURLS.length == 0) {
      print("Starting to load images");
      _imageLoadingState = "loading";
      notifyListeners();

      var l = await subscriptionsPageService.getLength();

      for (int i = 0; i < l ; i++) {
        String n = await subscriptionsPageService.getCoverArtURL(i);
        imageURLS.add(n);
      }
      _imageLoadingState = "loaded";
      print("Images loaded");
      notifyListeners();
    }
  }

  requestCoverArt(i) {
    if (i <= imageURLS.length) return imageURLS[i];
  }

  int requestLength() {
    return subscriptionsPageService.getLength();
  }

  requestPodcastName(int i) {
    return subscriptionsPageService.getPodcastName(i);
  }

  requestUploadedTime(int i) {
    int _n = subscriptionsPageService.getUploadedTime(i);

    return _n.toString() + " hours ago";
  }

  requestEpisodeName(int i) {
    return subscriptionsPageService.getEpisodeName(i);
  }

  requestEpisodeLength(int i) {
    int _n = subscriptionsPageService.getEpisodeLength(i);

    return _n.toString() + " minutes";
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
}
